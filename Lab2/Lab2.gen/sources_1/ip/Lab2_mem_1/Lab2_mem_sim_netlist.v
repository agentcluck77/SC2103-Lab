// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Wed Jan 28 13:52:55 2026
// Host        : hw3-r1-v01 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim d:/Lab2/Lab2.gen/sources_1/ip/Lab2_mem_1/Lab2_mem_sim_netlist.v
// Design      : Lab2_mem
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Lab2_mem,dist_mem_gen_v8_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dist_mem_gen_v8_0_13,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module Lab2_mem
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
  Lab2_mem_dist_mem_gen_v8_0_13 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 9376)
`pragma protect data_block
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
oRqh7pMZ+F/cX8v+apsMlj6sdH5b3uPcWQk02w==
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
