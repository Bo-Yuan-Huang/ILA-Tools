class Encoding:
	SOP2_PREFIX = 0b10
	SOPK_PREFIX = 0b1011
	SOP1_PREFIX = 0b101111101
	SOPC_PREFIX = 0b101111110
	SOPP_PREFIX = 0b101111111

	#format_S/V_function_datatype_OPCODE
	SOP2_S_ADD_U32_OPCODE = 0x0
	SOP2_S_SUB_U32_OPCODE = 0x1
	SOP2_S_ADD_I32_OPCODE = 0x2
	SOP2_S_SUB_I32_OPCODE = 0x3 
	SOP2_S_ADDC_U32_OPCODE = 0x4
	SOP2_S_SUBB_U32_OPCODE = 0x5
	SOP2_S_MIN_I32_OPCODE = 0x6
	SOP2_S_MIN_U32_OPCODE = 0x7
	SOP2_S_MAX_I32_OPCODE = 0x8
	SOP2_S_MAX_U32_OPCODE = 0x9
	SOP2_S_CSELECT_B32_OPCODE = 0xA
	SOP2_S_CSELECT_B64_OPCODE = 0xB
	SOP2_S_AND_B32_OPCODE = 0xE
	SOP2_S_AND_B64_OPCODE = 0xF
	SOP2_S_OR_B32_OPCODE = 0x10
	SOP2_S_OR_B64_OPCODE = 0x11
	SOP2_S_XOR_B32_OPCODE = 0x12
	SOP2_S_XOR_B64_OPCODE = 0x13
	SOP2_S_ANDN2_B32_OPCODE = 0x14
	SOP2_S_ANDN2_B64_OPCODE = 0x15
	SOP2_S_ORN2_B32_OPCODE = 0x16
	SOP2_S_ORN2_B64_OPCODE = 0x17
	SOP2_S_NAND_B32_OPCODE = 0x18
	SOP2_S_NAND_B64_OPCODE = 0x19
	SOP2_S_NOR_B32_OPCODE = 0x1A
	SOP2_S_NOR_B64_OPCODE = 0x1B
	SOP2_S_XNOR_B32_OPCODE = 0x1C
	SOP2_S_XNOR_B64_OPCODE = 0x1D
	SOP2_S_LSHL_B32_OPCODE = 0x1E
	SOP2_S_LSHL_B64_OPCODE = 0x1F
	SOP2_S_LSHR_B32_OPCODE = 0x20
	SOP2_S_LSHR_B64_OPCODE = 0x21
	SOP2_S_ASHR_I32_OPCODE = 0x22
	SOP2_S_ASHR_I64_OPCODE = 0x23
	SOP2_S_BFM_B32_OPCODE = 0x24
	SOP2_S_BFM_B64_OPCODE = 0x25
	SOP2_S_MUL_I32_OPCODE = 0x26
	SOP2_S_BFE_U32_OPCODE = 0x27		#instruction for bit field extraction
	SOP2_S_BFE_I32_OPCODE = 0x28		#instruction for bit field extraction 
    SOP2_S_BFE_U64_OPCODE = 0x29
    SOP2_S_BFE_I64_OPCODE = 0x2A
    SOP2_S_CBRANCH_G_FORK_OPCODE = 0x2B
    SOP2_S_ABSDIFF_I32_OPCODE = 0x2C

    SOPK_S_MOVK_I32_OPCODE = 0x0
    SOPK_S_CMOVK_I32_OPCODE = 0x2
    SOPK_S_CMPK_EQ_I32_OPCODE = 0x3
    SOPK_S_CMPK_LG_I32_OPCODE = 0x4
    SOPK_S_CMPK_GT_I32_OPCODE = 0x5
    SOPK_S_CMPK_GE_I32_OPCODE = 0x6
    SOPK_S_CMPK_LT_I32_OPCODE = 0x7
    SOPK_S_CMPK_LE_I32_OPCODE = 0x8
    SOPK_S_CMPK_EQ_U32_OPCODE = 0x9
    SOPK_S_CMPK_LG_U32_OPCODE = 0xA
    SOPK_S_CMPK_GT_U32_OPCODE = 0xB
    SOPK_S_CMPK_GE_U32_OPCODE = 0xC
    SOPK_S_CMPK_LT_U32_OPCODE = 0xD
    SOPK_S_CMPK_LE_U32_OPCODE = 0xE
    SOPK_S_ADDK_I32_OPCODE = 0xF
    SOPK_S_MULK_I32_OPCODE = 0x10
    SOPK_S_CBRANCH_I_FORK_OPCODE = 0x11
    SOPK_S_GETREG_B32_OPCODE = 0x12
    SOPK_S_SETREG_B32_OPCODE = 0x13
    SOPK_S_SETREG_IMM32_B32_OPCODE = 0x15

    SOP1_S_MOV_B32_OPCODE = 0x3
    SOP1_S_MOV_B64_OPCODE = 0x4
    SOP1_S_CMOV_B32_OPCODE = 0x5
    SOP1_S_CMOV_B64_OPCODE = 0x6
    SOP1_S_NOT_B32_OPCODE = 0x7
    SOP1_S_NOT_B64_OPCODE = 0x8
    SOP1_S_WQM_B32_OPCODE = 0x9 #NOT UNDERSTAND
    SOP1_S_WQM_B64_OPCODE = 0xA #NOT UNDERSTAND
    SOP1_S_BREV_B32_OPCODE = 0xB
    SOP1_S_BREV_B64_OPCODE = 0xC
    SOP1_S_BCNT0_I32_B32_OPCODE = 0xD
    SOP1_S_BCNT0_I32_B64_OPCODE = 0xE
    SOP1_S_BCNT1_I32_B32_OPCODE = 0xF
    SOP1_S_BCNT1_I32_B64_OPCODE = 0x10		#maybe the document is wrong, 
    SOP1_S_FF0_I32_B32_OPCODE = 0x11		#maybe the document is wrong,
    SOP1_S_FF0_I32_B64_OPCODE = 0x12		#maybe the document is wrong,
    SOP1_S_FF1_I32_B32_OPCODE = 0x13		#maybe the document is wrong,
    SOP1_S_FF1_I32_B64_OPCODE = 0x14		#maybe the document is wrong,
    SOP1_S_FLBIT_I32_B32_OPCODE = 0x15		#maybe the document is wrong,
    SOP1_S_FLBIT_I32_B64_OPCODE = 0x16		#maybe the document is wrong,
    SOP1_S_FLBIT_I32_OPCODE = 0x17			#maybe the document is wrong,
    SOP1_S_FLBIT_I32_I64_OPCODE = 0x18		#maybe the document is wrong,
    SOP1_S_SEXT_I32_I8_OPCODE = 0x19		#maybe the document is wrong,
    SOP1_S_SEXT_I32_I16_OPCODE = 0x1A
    SOP1_S_BITSET0_B32_OPCODE = 0x1B
    SOP1_S_BITSET0_B64_OPCODE = 0x1C
    SOP1_S_BITSET1_B32_OPCODE = 0x1D
    SOP1_S_BITSET1_B64_OPCODE = 0x1E
    SOP1_S_GETPC_B64_OPCODE = 0x1F
    SOP1_S_SETPC_B64_OPCODE = 0x20
    SOP1_S_SWAPPC_B64_OPCODE = 0x21
    SOP1_S_RFE_B64_OPCODE = 0x22
    SOP1_S_AND_SAVEEXEC_B64_OPCODE = 0x24
    SOP1_S_OR_SAVEEXEC_B64_OPCODE = 0x25
    SOP1_S_XOR_SAVEEXEC_B64_OPCODE = 0x26
    SOP1_S_ANDN2_SAVEEXEC_B64_OPCODE = 0x27
    SOP1_S_ORN2_SAVEEXEC_B64_OPCODE = 0x28
    SOP1_S_NAND_SAVEEXEC_B64_OPCODE = 0x29
    SOP1_S_NOR_SAVEEXEC_B64_OPCODE = 0x2A
    SOP1_S_XNOR_SAVEEXEC_B64_OPCODE = 0x2B
    SOP1_S_QUADMASK_B32_OPCODE = 0x2C	#NOT UNDERSTAND
    SOP1_S_QUADMASK_B64_OPCODE = 0x2D
    SOP1_S_MOVRELS_B32_OPCODE = 0x2E
    SOP1_S_MOVRELS_B64_OPCODE = 0x2F
    SOP1_S_MOVRELD_B32_OPCODE = 0x30
    SOP1_S_MOVRELD_B64_OPCODE = 0x31
    SOP1_S_CBRANCH_JOIN_OPCODE = 0x32
    SOP1_S_ABS_I32_OPCODE = 0x34
    SOP1_S_MOV_FED_B32_OPCODE = 0x35

    SOPC_S_CMP_EQ_I32_OPCODE = 0x0
    SOPC_S_CMP_LG_I32_OPCODE = 0x1
    SOPC_S_CMP_GT_I32_OPCODE = 0x2
    SOPC_S_CMP_GE_I32_OPCODE = 0x3
    SOPC_S_CMP_LT_I32_OPCODE = 0x4
    SOPC_S_CMP_LE_I32_OPCODE = 0x5
    SOPC_S_CMP_EQ_U32_OPCODE = 0x6
    SOPC_S_CMP_LG_U32_OPCODE = 0x7
    SOPC_S_CMP_GT_U32_OPCODE = 0x8
    SOPC_S_CMP_GE_U32_OPCODE = 0x9
    SOPC_S_CMP_LT_U32_OPCODE = 0xA
    SOPC_S_CMP_LE_U32_OPCODE = 0xB
    SOPC_S_BITCMP0_B32_OPCODE = 0xC
    SOPC_S_BITCMP1_B32_OPCODE = 0xD
    SOPC_S_BITCMP0_B64_OPCODE = 0xE
    SOPC_S_BITCMP1_B64_OPCODE = 0xF
    SOPC_S_SETVSKIP_OPCODE = 0x10 #Need to check the functionality of this op

    SOPP_S_NOP_OPCODE = 0x0
    SOPP_S_ENDPGM_OPCODE = 0x1
    SOPP_S_BRANCH_OPCODE = 0x2
    SOPP_S_CBRANCH_SCC0_OPCODE = 0x4
    SOPP_S_CBRANCH_SCC1_OPCODE = 0x5
    SOPP_S_CBRANCH_VCCZ_OPCODE = 0x6
    SOPP_S_CBRANCH_VCCNZ_OPCODE = 0x7
    SOPP_S_CBRANCH_EXECZ_OPCODE = 0x8
    SOPP_S_CBRANCH_EXECNZ_OPCODE = 0x9
    SOPP_S_BARRIER_OPCODE = 0xA
    SOPP_S_WAITCNT_OPCODE = 0xC #Need to check the functionality of this op
    SOPP_S_SETHALT_OPCODE = 0xD
    SOPP_S_SLEEP_OPCODE = 0xE
    SOPP_S_SETPRIO_OPCODE = 0xF
    SOPP_S_SENDMSG_OPCODE = 0x10
    SOPP_S_SENDMSGHALT_OPCODE = 0x11
    SOPP_S_TRAP_OPCODE = 0x12
    SOPP_S_ICACHE_INV_OPCODE = 0x13
    SOPP_S_INCPERFLEVEL_OPCODE = 0x14
    SOPP_S_DECPERFLEVEL_OPCODE = 0x15
    SOPP_S_TTRACEDATA_OPCODE = 0x16 #Need to check the functionality of this op

    VOP2_V_CNDMASK_B32 = 0x0
    VOP2_V_READLANE_B32 = 0x1
    VOP2_V_WRITELANE_B32 = 0x2
    VOP2_V_ADD_F32 = 0x3
    VOP2_V_SUB_F32 = 0x4
    VOP2_V_SUBREV_F32 = 0x5
    VOP2_V_MAC_LEGACY_F32 = 0x6
    VOP2_V_MUL_LEGACY_F32 = 0x7
    VOP2_V_MUL_F32 = 0x8
    VOP2_V_MUL_I32_I24 = 0x9
    VOP2_V_MUL_HI_I32_I24 = 0xA
    VOP2_V_MUL_U32_U24 = 0xB
    VOP2_V_MUL_HI_U32_U24 = 0xC
    VOP2_V_MIN_LEGACY_F32 = 0xD
    VOP2_V_MAX_LEGACY_F32 = 0xE
    VOP2_V_MIN_F32 = 0xF
    VOP2_V_MAX_F32 = 0x10
    VOP2_V_MIN_I32 = 0x11
    VOP2_V_MAX_I32 = 0x12
    VOP2_V_MIN_U32 = 0x13
    VOP2_V_MAX_U32 = 0x14
    VOP2_V_LSHR_B32 = 0x15
    VOP2_V_LSHRREV_B32 = 0x16
    VOP2_V_ASHR_I32 = 0x17
    VOP2_V_ASHRREV_I32 = 0x18
    VOP2_V_LSHL_B32 = 0x19
    VOP2_V_LSHLREV_B32 = 0x1A
    VOP2_V_AND_B32 = 0x1B
    VOP2_V_OR_B32 = 0x1C
    VOP2_V_XOR_B32 = 0x1D
    VOP2_V_BFM_B32 = 0x1E
    VOP2_V_MAC_F32 = 0x1F
    VOP2_V_MADMK_F32 = 0x20
    VOP2_V_MADAK_F32 = 0x12
    VOP2_V_BCNT_U32_B32 = 0x22
    VOP2_V_MBCNT_LO_U32_B32 = 0x23
    VOP2_V_MBCNT_HI_U32_B32 = 0x24
    VOP2_V_ADD_I32 = 0x25
    VOP2_V_SUB_I32 = 0x26
    VOP2_V_SUBREV_I32 = 0x27
    VOP2_V_ADDC_U32 = 0x28
    VOP2_V_SUBB_U32 = 0x29
    VOP2_V_SUBBREV_U32 = 0x2A
    VOP2_V_LDEXP_F32 = 0x2B
    VOP2_V_CVT_PKACCUM_U8_F32 = 0x2C
    VOP2_V_CVT_PKNORM_I16_F32 = 0x2D
    VOP2_V_CVT_PKNORM_U16_F32 = 0x2E
    VOP2_V_CVT_PKRTZ_F16_F32 = 0x2F
    VOP2_V_CVT_PK_U16_U32 = 0x30
    VOP2_V_CVT_PK_I16_I32 = 0x31

    VOP1_V_NOP = 0x0
    VOP1_V_MOV_B32 = 0x1
    VOP1_V_READFIRSTLANE_B32 = 0x2
    VOP1_V_CVT_I32_F64 = 0x3
    VOP1_V_CVT_F64_I32 = 0x4    
    VOP1_V_CVT_F32_I32 = 0x5
    VOP1_V_CVT_F32_U32 = 0x6
    VOP1_V_CVT_U32_F32 = 0x7
    VOP1_V_CVT_I32_F32 = 0x8
    VOP1_V_CVT_F16_F32 = 0xA
    VOP1_V_CVT_F32_F16 = 0xB
    VOP1_V_CVT_RPI_I32_F32 = 0xC
    VOP1_V_CVT_FLR_I32_F32 = 0xD
    VOP1_V_CVT_OFF_F32_I4 = 0xE
    VOP1_V_CVT_F32_F64 = 0xF
    VOP1_V_CVT_F64_F32 = 0x10
    VOP1_V_CVT_F32_UBYTE0 = 0x11
    VOP1_V_CVT_F32_UBYTE1 = 0x12
    VOP1_V_CVT_F32_UBYTE2 = 0x13   
    VOP1_V_CVT_F32_UBYTE3 = 0x14
    VOP1_V_CVT_U32_F64 = 0x15
    VOP1_V_CVT_F64_U32 = 0x16
    VOP1_V_FRACT_F32 = 0x20
    VOP1_V_TRUNC_F32 = 0x21
    VOP1_V_CEIL_F32 = 0x22
    VOP1_V_RNDNE_F32 = 0x23
    VOP1_V_FLOOR_F32 = 0x24
    VOP1_V_EXP_F32 = 0x25
    VOP1_V_LOG_CLAMP_F32 = 0x26
    VOP1_V_LOG_F32 = 0x27
    VOP1_V_RCP_CLAMP_F32 = 0x28
    VOP1_V_RCP_LEGACY_F32 = 0x29
    VOP1_V_RCP_F32 = 0x2A
    VOP1_V_RCP_IFLAG_F32 = 0x2B
    VOP1_V_RSQ_CLAMP_F32 = 0x2C
    VOP1_V_RSQ_LEGACY_F32 = 0x2D
    VOP1_V_RSQ_F32 = 0x2E
    VOP1_V_RCP_F64 = 0x2F
    VOP1_V_RCP_CLAMP_F64 = 0x30
    VOP1_V_RSQ_F64 = 0x31
    VOP1_V_RSQ_CLAMP_F64 = 0x32
    VOP1_V_SQRT_F32 = 0x33
    VOP1_V_SQRT_F64 = 0x34
    VOP1_V_SIN_F32 = 0x35
    VOP1_V_COS_F32 = 0x36
    VOP1_V_NOT_B32 = 0x37
    VOP1_V_BFREV_B32 = 0x38
    VOP1_V_FFBH_U32 = 0x39
    VOP1_V_FFBL_B32 = 0x3A
    VOP1_V_FFBH_I32 = 0x3B
    VOP1_V_FREXP_EXP_I32_F64 = 0x3C
    VOP1_V_FREXP_MANT_F64 = 0x3D
    VOP1_V_FRACT_F64 = 0x3E
    VOP1_V_FREXP_EXP_I32_F32 = 0x3F
    VOP1_V_FREXP_MANT_F32 = 0x40
    VOP1_V_CLREXCP = 0x41
    VOP1_V_MOVRELD_B32 = 0x42
    VOP1_V_MOVRELS_B32 = 0x43
    VOP1_V_MOVRELSD_B32 = 0x44
