/// \file
/// The header for LMAC ILA.

#ifndef LMAC_ILA_H__
#define LMAC_ILA_H__

#include <ilang/ilang++.h>

#define LMAC_MMIO_OFFSET_FMAC_TX_PKT_CNT 0x1020
#define LMAC_MMIO_OFFSET_FMAC_RX_PKT_CNT_LO 0x1028
#define LMAC_MMIO_OFFSET_FMAC_RX_PKT_CNT_HI 0x102c
#define LMAC_MMIO_OFFSET_FMAC_TX_BYTE_CNT 0x1030
#define LMAC_MMIO_OFFSET_FMAC_RX_BYTE_CNT_LO 0x1038
#define LMAC_MMIO_OFFSET_FMAC_RX_BYTE_CNT_HI 0x103c
#define LMAC_MMIO_OFFSET_FMAC_RX_UNDERSIZE_PKT_CNT 0x1040
#define LMAC_MMIO_OFFSET_FMAC_RX_CRC32_ERR_CNT 0x1048
#define LMAC_MMIO_OFFSET_FMAC_RX_DCNT_OVERRUN 0x1050
#define LMAC_MMIO_OFFSET_FMAC_RX_DCNT_LINK_ERR 0x1058
#define LMAC_MMIO_OFFSET_FMAC_RX_PKT_CNT_OVERSIZE 0x1060
#define LMAC_MMIO_OFFSET_FMAC_PHY_STAT 0x1068
#define LMAC_MMIO_OFFSET_FMAC_RX_PKT_CNT_JABBER 0x1078
#define LMAC_MMIO_OFFSET_FMAC_RX_PKT_CNT_FRAGMENT 0x1080
#define LMAC_MMIO_OFFSET_FMAC_RX_RAW_FRAME_CNT 0x1088
#define LMAC_MMIO_OFFSET_FMAC_RX_BAD_FRAME_CNT 0x1090
#define LMAC_MMIO_OFFSET_FMAC_RX_PKT_CNT64_LO 0x1800
#define LMAC_MMIO_OFFSET_FMAC_RX_PKT_CNT64_HI 0x1804
#define LMAC_MMIO_OFFSET_FMAC_RX_PKT_CNT127_LO 0x1808
#define LMAC_MMIO_OFFSET_FMAC_RX_PKT_CNT127_HI 0x180c
#define LMAC_MMIO_OFFSET_FMAC_RX_PKT_CNT255_LO 0x1810
#define LMAC_MMIO_OFFSET_FMAC_RX_PKT_CNT255_HI 0x1814
#define LMAC_MMIO_OFFSET_FMAC_RX_PKT_CNT511_LO 0x1818
#define LMAC_MMIO_OFFSET_FMAC_RX_PKT_CNT511_HI 0x181c
#define LMAC_MMIO_OFFSET_FMAC_RX_PKT_CNT1023_LO 0x1820
#define LMAC_MMIO_OFFSET_FMAC_RX_PKT_CNT1023_HI 0x1824
#define LMAC_MMIO_OFFSET_FMAC_RX_PKT_CNT1518_LO 0x1828
#define LMAC_MMIO_OFFSET_FMAC_RX_PKT_CNT1518_HI 0x182c

/// \namespace ilang
namespace ilang {

Ila GetLmacIla(const std::string& name = "lmac");

void DefineArchState(Ila& m);

void DefineInstruction(Ila& m);

}; // namespace ilang

#endif // LMAC_ILA_H__

