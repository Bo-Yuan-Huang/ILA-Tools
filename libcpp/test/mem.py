import ila

def foo(d):
    ram = d['iram']
    addr = d['addr']
    print ram, addr

    return ram[addr]+1

def main():
    sys = ila.Abstraction()
    iram = sys.mem('iram', 8, 8)
    addr = sys.reg('addr', 8)
    print iram, iram.type
    data = iram[addr]

    addrp = sys.reg('addrp', 8)
    datap = iram[addrp]

    t = sys.bool(True)
    f = sys.bool(False)

    assert sys.areEqual((addr != addrp) | (data == datap), t)

    print data, data.type
    datap = data+1
    print datap, datap.type

    iramp = ila.store(iram, addr, data+1)
    print iramp, iramp.type

    assert sys.areEqual(iramp[addr], data+1)
    assert not sys.areEqual(data, data+1)

    m = ila.MemValues(8, 8, 0xff)
    print m

    for i in xrange(0x80, 0x90):
        m[i] = i-0x80
    print m

    for i in xrange(0x0, 0x100):
        if i >= 0x80 and i < 0x90:
            assert m[i] == i-0x80
        else:
            assert m[i] == 0xff

    print m
    m1 = sys.const(m)

    assert m.default == 0xff
    m.default = 0x0
    print m
    assert m[0] == 0
    print m.values

    m2 = sys.const(m)

    # assert not sys.areEqual(m1[addr], m2[addr])
    ante = ((addr >= 0x80) & (addr < 0x90))
    conseq = (m1[addr] == m2[addr])

    assert sys.areEqual(ila.implies(ante, conseq), t)
    assert not sys.areEqual(conseq, t)

    r1 = iram[addr]+1
    r2 = iram[addr]+iram[addr+1]
    r = sys.choice('r', r1, r2)
    print sys.synthesize(r, foo)

    def bar(d):
        print d
        ram = d['iram']
        ram_ = ila.MemValues(8, 8, ram.default)
        print ram
        print ram_
        for (ad, da) in ram.values:
            ram_[ad] = da
        addr = d['addr']
        print ram_, addr, ram[addr]
        ram_[addr] = ram_[addr]+1
        print ram_
        return ram_

    r1 = ila.store(iram, addr, iram[addr]+1)
    r2 = ila.store(iram, addr, iram[addr]+2)
    rp = sys.choice('rp', r1, r2)
    print sys.synthesize(rp, bar)

if __name__ == '__main__':
    main()
