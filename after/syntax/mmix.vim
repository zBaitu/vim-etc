"if exists("b:current_syntax")
"  finish
"endif

syn case match

" MMIX data types
syn keyword mmixType    BYTE WYDE TETRA OCTA

" different literals...
syn match decNumber        "[0-9]*"
syn match octNumber        "0[0-7][0-7]\+"
syn match hexNumber        "#[0-9a-fA-F]\+"
syn region mmixString        start=+"+ skip=+\\"+ end=+"+ contains=@Spell
syn match mmixChar        "'.'"

" ...and more special MMIX stuff
syn match mmixAt        "@"
syn keyword mmixSegments    Data_Segment Pool_Segment Stack_Segment

syn match mmixIdentifier    "[a-zA-Z_][a-zA-Z0-9_]*"

" labels (for branches etc)
syn match mmixLabel        "^[a-zA-Z0-9_:][a-zA-Z0-9_:]*"
syn match mmixLabel        "[0-9][HBF]"

" pseudo-operations
syn keyword mmixPseudo        IS LOC GREG

" comments
syn match mmixComment        "%.*" contains=@Spell
syn match mmixComment        "//.*" contains=@Spell
syn match mmixComment        "^\*.*" contains=@Spell


syn keyword mmixOpcode    TRAP FCMP FUN FEQL FADD FIX FSUB FIXU
syn keyword mmixOpcode    FMUL FCMPE FUNE FEQLE FDIV FSQRT FREM FINT

syn keyword mmixOpcode    FLOTI FLOTUI SFLOTI SFLOTUI I
syn keyword mmixOpcode    MULI MULUI DIVI DIVUI
syn keyword mmixOpcode    ADDI ADDUI SUBI SUBUI
syn keyword mmixOpcode    2ADDUI 4ADDUI 8ADDUI 16ADDUI
syn keyword mmixOpcode    CMPI CMPUI NEGI NEGUI
syn keyword mmixOpcode    SLI SLUI SRI SRUI
syn keyword mmixOpcode    BNB BZB BPB BODB
syn keyword mmixOpcode    BNNB BNZB BNPB BEVB
syn keyword mmixOpcode    PBNB PBZB PBPB PBODB
syn keyword mmixOpcode    PBNNB PBNZB PBNPB PBEVB
syn keyword mmixOpcode    CSNI CSZI CSPI CSODI
syn keyword mmixOpcode    CSNNI CSNZI CSNPI CSEVI
syn keyword mmixOpcode    ZSNI ZSZI ZSPI ZSODI
syn keyword mmixOpcode    ZSNNI ZSNZI ZSNPI ZSEVI
syn keyword mmixOpcode    LDBI LDBUI LDWI LDWUI
syn keyword mmixOpcode    LDTI LDTUI LDOI LDOUI
syn keyword mmixOpcode    LDSFI LDHTI CSWAPI LDUNCI
syn keyword mmixOpcode    LDVTSI PRELDI PREGOI GOI
syn keyword mmixOpcode    STBI STBUI STWI STWUI
syn keyword mmixOpcode    STTI STTUI STOI STOUI
syn keyword mmixOpcode    STSFI STHTI STCOI STUNCI
syn keyword mmixOpcode    SYNCDI PRESTI SYNCIDI PUSHGOI
syn keyword mmixOpcode    ORI ORNI NORI XORI
syn keyword mmixOpcode    ANDI ANDNI NANDI NXORI
syn keyword mmixOpcode    BDIFI WDIFI TDIFI ODIFI
syn keyword mmixOpcode    MUXI SADDI MORI MXORI
syn keyword mmixOpcode    MULI MULUI DIVI DIVUI

syn keyword mmixOpcode    FLOT FLOTU SFLOT SFLOTU
syn keyword mmixOpcode    MUL MULU DIV DIVU
syn keyword mmixOpcode    ADD ADDU SUB SUBU
syn keyword mmixOpcode    2ADDU 4ADDU 8ADDU 16ADDU
syn keyword mmixOpcode    CMP CMPU NEG NEGU
syn keyword mmixOpcode    SL SLU SR SRU
syn keyword mmixOpcode    BN BZ BP BOD
syn keyword mmixOpcode    BNN BNZ BNP BEV
syn keyword mmixOpcode    PBN PBZ PBP PBOD
syn keyword mmixOpcode    PBNN PBNZ PBNP PBEV
syn keyword mmixOpcode    CSN CSZ CSP CSOD
syn keyword mmixOpcode    CSNN CSNZ CSNP CSEV
syn keyword mmixOpcode    ZSN ZSZ ZSP ZSOD
syn keyword mmixOpcode    ZSNN ZSNZ ZSNP ZSEV
syn keyword mmixOpcode    LDB LDBU LDW LDWU
syn keyword mmixOpcode    LDT LDTU LDO LDOU
syn keyword mmixOpcode    LDSF LDHT CSWAP LDUNC
syn keyword mmixOpcode    LDVTS PRELD PREGO GO
syn keyword mmixOpcode    STB STBU STW STWU
syn keyword mmixOpcode    STT STTU STO STOU
syn keyword mmixOpcode    STSF STHT STCO STUNC
syn keyword mmixOpcode    SYNCD PREST SYNCID PUSHGO
syn keyword mmixOpcode    OR ORN NOR XOR
syn keyword mmixOpcode    AND ANDN NAND NXOR
syn keyword mmixOpcode    BDIF WDIF TDIF ODIF
syn keyword mmixOpcode    MUX SADD MOR MXOR

syn keyword mmixOpcode    SETH SETMH SETML SETL INCH INCMH INCML INCL
syn keyword mmixOpcode    ORH ORMH ORML ORL ANDH ANDMH ANDML ANDNMH ANDNL ANDNML
syn keyword mmixOpcode    JMP PUSHJ GETA PUT
syn keyword mmixOpcode    POP RESUME SAVE UNSAVE SYNC SWYM GET TRIP
syn keyword mmixOpcode    SET LDA

" switch back to being case sensitive
syn case match

" general-purpose and special-purpose registers
syn match mmixRegister        "$[0-9]*"
syn match mmixRegister        ":*r[A-Z]"
syn keyword mmixRegister    rBB rTT rWW rXX rYY rZZ

syn region  mmixNAMESPACE start="^\s*PREFIX" skip="\\$" end="$"
syn region mmixTEST start="\[" end="\]"

" The default methods for highlighting.  Can be overridden later
hi def link mmixAt        Type
hi def link mmixPseudo    Type
hi def link mmixRegister    Special
hi def link mmixSegments    Type

hi def link mmixComment    Comment
hi def link mmixOpcode    Keyword

hi def link hexNumber    Number
hi def link decNumber    Number
hi def link octNumber    Number

hi def link mmixString    String
hi def link mmixChar    String

hi def link mmixType    Type
hi def link mmixIdentifier    Normal
hi def link mmixSpecialComment Comment

hi mmixNAMESPACE ctermfg=25 ctermbg=NONE cterm=NONE"
hi mmixTEST ctermfg=25 ctermbg=NONE cterm=NONE"
hi mmixLabel ctermfg=166 ctermbg=NONE cterm=NONE"

let b:current_syntax = "mmix"
