// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Wed Jan 28 13:52:54 2026
// Host        : hw3-r1-v01 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ Lab2_mem_sim_netlist.v
// Design      : Lab2_mem
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Lab2_mem,dist_mem_gen_v8_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dist_mem_gen_v8_0_13,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (a,
    d,
    clk,
    we,
    spo);
  input [5:0]a;
  input [7:0]d;
  input clk;
  input we;
  output [7:0]spo;

  wire [5:0]a;
  wire clk;
  wire [7:0]d;
  wire [7:0]spo;
  wire we;
  wire [7:0]NLW_U0_dpo_UNCONNECTED;
  wire [7:0]NLW_U0_qdpo_UNCONNECTED;
  wire [7:0]NLW_U0_qspo_UNCONNECTED;

  (* C_FAMILY = "artix7" *) 
  (* C_HAS_CLK = "1" *) 
  (* C_HAS_D = "1" *) 
  (* C_HAS_DPO = "0" *) 
  (* C_HAS_DPRA = "0" *) 
  (* C_HAS_QDPO = "0" *) 
  (* C_HAS_QDPO_CE = "0" *) 
  (* C_HAS_QDPO_CLK = "0" *) 
  (* C_HAS_QDPO_RST = "0" *) 
  (* C_HAS_QDPO_SRST = "0" *) 
  (* C_HAS_WE = "1" *) 
  (* C_MEM_TYPE = "1" *) 
  (* C_QCE_JOINED = "0" *) 
  (* C_REG_DPRA_INPUT = "0" *) 
  (* c_addr_width = "6" *) 
  (* c_default_data = "0" *) 
  (* c_depth = "64" *) 
  (* c_elaboration_dir = "./" *) 
  (* c_has_i_ce = "0" *) 
  (* c_has_qspo = "0" *) 
  (* c_has_qspo_ce = "0" *) 
  (* c_has_qspo_rst = "0" *) 
  (* c_has_qspo_srst = "0" *) 
  (* c_has_spo = "1" *) 
  (* c_mem_init_file = "no_coe_file_loaded" *) 
  (* c_parser_type = "1" *) 
  (* c_pipeline_stages = "0" *) 
  (* c_qualify_we = "0" *) 
  (* c_read_mif = "0" *) 
  (* c_reg_a_d_inputs = "0" *) 
  (* c_sync_enable = "1" *) 
  (* c_width = "8" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dist_mem_gen_v8_0_13 U0
       (.a(a),
        .clk(clk),
        .d(d),
        .dpo(NLW_U0_dpo_UNCONNECTED[7:0]),
        .dpra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .i_ce(1'b1),
        .qdpo(NLW_U0_qdpo_UNCONNECTED[7:0]),
        .qdpo_ce(1'b1),
        .qdpo_clk(1'b0),
        .qdpo_rst(1'b0),
        .qdpo_srst(1'b0),
        .qspo(NLW_U0_qspo_UNCONNECTED[7:0]),
        .qspo_ce(1'b1),
        .qspo_rst(1'b0),
        .qspo_srst(1'b0),
        .spo(spo),
        .we(we));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2022.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
M9ERyrMNmk2Jjyg6ZCGYQpTqx5C+74+ICn/vAQ5KoRuxJNbql8tHJjFcOe3FAJX14Nokq4wtfvZP
2sPXAs/eYYzjjbnt4nx8oZRRPy0XyDpvba/qxyqBSxjChIoPMDwpXnxi+chZJU5N1zCNt9FZPAep
nLCjMCkQTlKbP3cUJIY=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
FBAg02qOh8M8uZkNvwWHoY3ELncwvHjjgL2y2qLN7xuxxaPQj3LdyD/IETTPdSjNCB/rhpJxbT1y
U5fbF28Hkp+bzDuxeTWPX251wMhiEmdm4jhyMl2z+GRf2Z6VJ4bVM5bieaJvsbjuyQ9Az6TDmueI
14citDEbyRCyJD9EiVckdS2mZcTl37oVFebKnIeJGmNjOc2XrcM84JVJIG5iv3ryS2hAG9/84hEr
u3DYC+xS2w5swJXVSf0zV+w8xZulS3PTPLELIM8O+SEFdHetZKnrgG1aJ7V5xu0RniGAsyVwVbgu
M1jPqNLyU+9kyETKfG9jcGEIM2I2gUfmOvRs+g==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
TYvdYOtu2OcY/hp0LCFlgwGgJeLJ5MSBDPjuyI3760LiXtklDVs7CUFlvRRXMgAzbHlMXbiHp/Xl
cvmN035ayt8D8gPWRXxnbQf3kRlW6EIFwFMZ1inL9b5f47gsuvCP6MaKiTg0W7+/ZeHbM4jHXvRe
b8HXvQvK5kVwtayEwt0=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
GkcGg32vdV7ZS9x4Uw9v3hZEcxD5hMmQXUqa6shDPbzqUGIxrKpTOb9W4Sgi8rq+qw7QpAZp2JW/
MkYAH1WikFlf+XWG57y55EFV7oRoKQDh2Yz0sZEwVhwTGwSAqfnjrmPITofdG5eiey1ySGprEKsT
mqWAV+ZN7TkQkKup0Ukf1O+8giYKT/7UibTRqG/CT9dgU/4atPgYh2QjNMVrsAH/uzDxh7stQMYe
nkjZBkpLWOq7mxEXTKVtYAD/8G5qCJELRcvCuUKYz4Une1wDj+L/vwRK3IAdWKQ+/5mvj0q5XEm7
IKu5HYvalbySwRWzaB00uobXZorNhfwSv45jHg==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
JnT3Bfv/DUBx2mIm4+jpmHjzhKoX4mNpcc/lgscv3iYrJw8Uble396hMwPsVZ+kkAsmYtegNCiTG
Z7kqnoNeWHv+Grdizsq0QM9S2KJ5EoZhjelE+3Cii/ztNHf7Y3c0nBPnioUQ5YmWk7vgoQl3SJ3d
vwD3G0c+fGJBRpi14hTJOB2wtu4EeWcJ1f+01LjKINeucLlwacjnN0tElyRgCNKfsRDAQiMqwKqg
XCleeNY0cyLXGI30pXMpnbLizYlNKgVD6DSeNaby0dhW4phR0a+9xteo8l8eRVzTO+VSOcYSy8rU
6Uj2y0Up19vcq91C+/YeHlh24VwNI2TJeUEDwQ==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_07", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
AWr8D+IaT/X0jMJSrwmWnhWOjt0+8oyULINYaH7QGBLgqKCVtf8rqo68R3/TZ8gTkN73fZOx0QCU
3WEp7Ga1gUsqEgy+2zGlncYhOzx62FJm4Pm7S6LbE1qdg3/9Pp55JLaf1ouYlZccQJ+yawj0HgL4
zR0T347Zg2aIFxQZ28icCuJbxAZsZgAT30scXsTMMvXlQQ9NI21OjirKgHRn3dldIjpkL+BrVBkQ
Q7MMiTBhpCn/c+WXk4H9BPc3vMrVoh6r5oo+e1858Hk7osyxNI9zuACaGwdAatsW756kQBMsQoUj
TmJksSfucjrHVSuLFffpztOARH3LXrhZcCZdoQ==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
fPVwMHnHe1L8weZTnbBxjlAabwZZnO4DZSHaO7tHGHAw6U+w+7Rc3BwfQXtiTyGXP15rvoLhvVpo
i1Tzs4zrV1X8vlWrxhS6XA2VO4RFkpCjmnHpvdgnW9mpk7w90QOEZIWZQST/o15t0wDT/kv4J36r
Ho59mVFCGQQSSYx0209u6sG2rNpJ5HtWMM+tDEDHUArucrBmPOoZSq0VSQsTHtjJQxr3U5fv9l6q
aEBWkjnLJ6zqLkt12B3q7V3iFORPpz6XNMqA6wzArzWirzgTCw3CduiSAgbNgoGmV4eNrVb2DfOT
5V4ni19GigMG1fHCD9dNPWGiRCWpY6iiN6iE1w==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
NkQB16Pku9sdGFuAkY+DjFhWzKYvb26AsK/VO1//MS5ztnK+V9d/0K8nVee9kGDNC4zorSd1NjRc
Jkj/JJm1k/9QiQQwOSB/94zKWUyVH2Rvw3UOuaTu9pWRQsIdmPNwXBKCOF5L17HHGaNqYzvHF7YY
REIp6VR4HcyLq2beYXn09Mq0f84obUr7+CMgh8i1SaLa/ydMPS9xsm1i0NFB3qcEC0dDq6xklwsX
s198UBI5mBJTEUKi38eytWXzQPFTmqdlD3Qn4CgstxSdoLrFHchISqt+L62U4xU6aVyYXmVaeebF
I1F3MAXQZwZwGETW7RW9t/+3pJtkjPfPtdnqu/Sg+zP+vLjSV/NcONctKnTj86/z+TTehoSH8ccr
BsjV0PhAtR3+RTr3VGkKJoUNeE8yFQIHlES8UamuSNMh5XrbmcbFx22MZ9gLOa350ytm1N124jNF
V860l5gGbt/8NcGf8I3EVPrYblJ5ZLGsZkVg1cKBMUys1yMm6Ci2Mruc

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
JDELzo7luYHcwIl8sAAMR3hvm1tr+ZaD3VKTvYj1uwYFwuIPCkUfjVi8OMAgp3Hh/R1wDZSeoY7T
xpO0sKF9MsovKwwArnByLL8zZflfJIe5AmC+jE5a8qUxydp4liMdOypRTLu6U6EUYUwSj6VOR0Uj
deCoQCr/gVZ2GdNKF5sKZsGXZSvx1Wag70BiGs69qhgUvVVlpbqpNRSB0DR/2IuSKCHhkucLXiTk
zVS7zC7GiyNYE6l/Yu5Ov25Cl+lY5cMZkqKvIFm90UiTBNYk4No5ofXnH/E0rNcbydv0BvWDmgKt
NXVratbi0ztKLb27z2lw5ZZzXCihB41kx4VjqA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 9408)
`pragma protect data_block
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
0vIv
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
