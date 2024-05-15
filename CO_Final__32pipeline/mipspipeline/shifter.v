module shifter( dataA, dataB, out );

input [31:0] dataA;
input [4:0] dataB;
output wire [31:0] out;

wire [31:0] temp, temp1, temp2, temp3, temp4 ;

assign temp[0] = dataB[0] ? 1'b0:dataA[0];
assign temp[1] = dataB[0] ? dataA[0]:dataA[1];
assign temp[2] = dataB[0] ? dataA[1]:dataA[2];
assign temp[3] = dataB[0] ? dataA[2]:dataA[3];
assign temp[4] = dataB[0] ? dataA[3]:dataA[4];
assign temp[5] = dataB[0] ? dataA[4]:dataA[5];
assign temp[6] = dataB[0] ? dataA[5]:dataA[6];
assign temp[7] = dataB[0] ? dataA[6]:dataA[7];
assign temp[8] = dataB[0] ? dataA[7]:dataA[8];
assign temp[9] = dataB[0] ? dataA[8]:dataA[9];
assign temp[10] = dataB[0] ? dataA[9]:dataA[10];
assign temp[11] = dataB[0] ? dataA[10]:dataA[11];
assign temp[12] = dataB[0] ? dataA[11]:dataA[12];
assign temp[13] = dataB[0] ? dataA[12]:dataA[13];
assign temp[14] = dataB[0] ? dataA[13]:dataA[14];
assign temp[15] = dataB[0] ? dataA[14]:dataA[15];
assign temp[16] = dataB[0] ? dataA[15]:dataA[16];
assign temp[17] = dataB[0] ? dataA[16]:dataA[17];
assign temp[18] = dataB[0] ? dataA[17]:dataA[18];
assign temp[19] = dataB[0] ? dataA[18]:dataA[19];
assign temp[20] = dataB[0] ? dataA[19]:dataA[20];
assign temp[21] = dataB[0] ? dataA[20]:dataA[21];
assign temp[22] = dataB[0] ? dataA[21]:dataA[22];
assign temp[23] = dataB[0] ? dataA[22]:dataA[23];
assign temp[24] = dataB[0] ? dataA[23]:dataA[24];
assign temp[25] = dataB[0] ? dataA[24]:dataA[25];
assign temp[26] = dataB[0] ? dataA[25]:dataA[26];
assign temp[27] = dataB[0] ? dataA[26]:dataA[27];
assign temp[28] = dataB[0] ? dataA[27]:dataA[28];
assign temp[29] = dataB[0] ? dataA[28]:dataA[29];
assign temp[30] = dataB[0] ? dataA[29]:dataA[30];
assign temp[31] = dataB[0] ? dataA[30]:dataA[31];

assign temp1[0] = dataB[1] ? 1'b0:temp[0];
assign temp1[1] = dataB[1] ? 1'b0:temp[1];
assign temp1[2] = dataB[1] ? temp[0]:temp[2];
assign temp1[3] = dataB[1] ? temp[1]:temp[3];
assign temp1[4] = dataB[1] ? temp[2]:temp[4];
assign temp1[5] = dataB[1] ? temp[3]:temp[5];
assign temp1[6] = dataB[1] ? temp[4]:temp[6];
assign temp1[7] = dataB[1] ? temp[5]:temp[7];
assign temp1[8] = dataB[1] ? temp[6]:temp[8];
assign temp1[9] = dataB[1] ? temp[7]:temp[9];
assign temp1[10] = dataB[1] ? temp[8]:temp[10];
assign temp1[11] = dataB[1] ? temp[9]:temp[10];
assign temp1[12] = dataB[1] ? temp[10]:temp[12];
assign temp1[13] = dataB[1] ? temp[11]:temp[13];
assign temp1[14] = dataB[1] ? temp[12]:temp[14];
assign temp1[15] = dataB[1] ? temp[13]:temp[15];
assign temp1[16] = dataB[1] ? temp[14]:temp[16];
assign temp1[17] = dataB[1] ? temp[15]:temp[17];
assign temp1[18] = dataB[1] ? temp[16]:temp[18];
assign temp1[19] = dataB[1] ? temp[17]:temp[19];
assign temp1[20] = dataB[1] ? temp[18]:temp[20];
assign temp1[21] = dataB[1] ? temp[19]:temp[21];
assign temp1[22] = dataB[1] ? temp[20]:temp[22];
assign temp1[23] = dataB[1] ? temp[21]:temp[23];
assign temp1[24] = dataB[1] ? temp[22]:temp[24];
assign temp1[25] = dataB[1] ? temp[23]:temp[25];
assign temp1[26] = dataB[1] ? temp[24]:temp[26];
assign temp1[27] = dataB[1] ? temp[25]:temp[27];
assign temp1[28] = dataB[1] ? temp[26]:temp[28];
assign temp1[29] = dataB[1] ? temp[27]:temp[29];
assign temp1[30] = dataB[1] ? temp[28]:temp[30];
assign temp1[31] = dataB[1] ? temp[29]:temp[31];

assign temp2[0] = dataB[2] ? 1'b0:temp1[0];
assign temp2[1] = dataB[2] ? 1'b0:temp1[1];
assign temp2[2] = dataB[2] ? 1'b0:temp1[2];
assign temp2[3] = dataB[2] ? 1'b0:temp1[3];
assign temp2[4] = dataB[2] ? temp1[0]:temp1[4];
assign temp2[5] = dataB[2] ? temp1[1]:temp1[5];
assign temp2[6] = dataB[2] ? temp1[2]:temp1[6];
assign temp2[7] = dataB[2] ? temp1[3]:temp1[7];
assign temp2[8] = dataB[2] ? temp1[4]:temp1[8];
assign temp2[9] = dataB[2] ? temp1[5]:temp1[9];
assign temp2[10] = dataB[2] ? temp1[6]:temp1[10];
assign temp2[11] = dataB[2] ? temp1[7]:temp1[11];
assign temp2[12] = dataB[2] ? temp1[8]:temp1[12];
assign temp2[13] = dataB[2] ? temp1[9]:temp1[13];
assign temp2[14] = dataB[2] ? temp1[10]:temp1[14];
assign temp2[15] = dataB[2] ? temp1[11]:temp1[15];
assign temp2[16] = dataB[2] ? temp1[12]:temp1[16];
assign temp2[17] = dataB[2] ? temp1[13]:temp1[17];
assign temp2[18] = dataB[2] ? temp1[14]:temp1[18];
assign temp2[19] = dataB[2] ? temp1[15]:temp1[19];
assign temp2[20] = dataB[2] ? temp1[16]:temp1[20];
assign temp2[21] = dataB[2] ? temp1[17]:temp1[21];
assign temp2[22] = dataB[2] ? temp1[18]:temp1[22];
assign temp2[23] = dataB[2] ? temp1[19]:temp1[23];
assign temp2[24] = dataB[2] ? temp1[20]:temp1[24];
assign temp2[25] = dataB[2] ? temp1[21]:temp1[25];
assign temp2[26] = dataB[2] ? temp1[22]:temp1[26];
assign temp2[27] = dataB[2] ? temp1[23]:temp1[27];
assign temp2[28] = dataB[2] ? temp1[24]:temp1[28];
assign temp2[29] = dataB[2] ? temp1[25]:temp1[29];
assign temp2[30] = dataB[2] ? temp1[26]:temp1[30];
assign temp2[31] = dataB[2] ? temp1[27]:temp1[31];

assign temp3[0] = dataB[3] ? 1'b0:temp2[0];
assign temp3[1] = dataB[3] ? 1'b0:temp2[1];
assign temp3[2] = dataB[3] ? 1'b0:temp2[2];
assign temp3[3] = dataB[3] ? 1'b0:temp2[3];
assign temp3[4] = dataB[3] ? 1'b0:temp2[4];
assign temp3[5] = dataB[3] ? 1'b0:temp2[5];
assign temp3[6] = dataB[3] ? 1'b0:temp2[6];
assign temp3[7] = dataB[3] ? 1'b0:temp2[7];
assign temp3[8] = dataB[3] ? temp2[0]:temp2[8];
assign temp3[9] = dataB[3] ? temp2[1]:temp2[9];
assign temp3[10] = dataB[3] ? temp2[2]:temp2[10];
assign temp3[11] = dataB[3] ? temp2[3]:temp2[11];
assign temp3[12] = dataB[3] ? temp2[4]:temp2[12];
assign temp3[13] = dataB[3] ? temp2[5]:temp2[13];
assign temp3[14] = dataB[3] ? temp2[6]:temp2[14];
assign temp3[15] = dataB[3] ? temp2[7]:temp2[15];
assign temp3[16] = dataB[3] ? temp2[8]:temp2[16];
assign temp3[17] = dataB[3] ? temp2[9]:temp2[17];
assign temp3[18] = dataB[3] ? temp2[10]:temp2[18];
assign temp3[19] = dataB[3] ? temp2[11]:temp2[19];
assign temp3[20] = dataB[3] ? temp2[12]:temp2[20];
assign temp3[21] = dataB[3] ? temp2[13]:temp2[21];
assign temp3[22] = dataB[3] ? temp2[14]:temp2[22];
assign temp3[23] = dataB[3] ? temp2[15]:temp2[23];
assign temp3[24] = dataB[3] ? temp2[16]:temp2[24];
assign temp3[25] = dataB[3] ? temp2[17]:temp2[25];
assign temp3[26] = dataB[3] ? temp2[18]:temp2[26];
assign temp3[27] = dataB[3] ? temp2[19]:temp2[27];
assign temp3[28] = dataB[3] ? temp2[20]:temp2[28];
assign temp3[29] = dataB[3] ? temp2[21]:temp2[29];
assign temp3[30] = dataB[3] ? temp2[22]:temp2[30];
assign temp3[31] = dataB[3] ? temp2[23]:temp2[31];

assign temp4[0] = dataB[4] ? 1'b0:temp3[0];
assign temp4[1] = dataB[4] ? 1'b0:temp3[1];
assign temp4[2] = dataB[4] ? 1'b0:temp3[2];
assign temp4[3] = dataB[4] ? 1'b0:temp3[3];
assign temp4[4] = dataB[4] ? 1'b0:temp3[4];
assign temp4[5] = dataB[4] ? 1'b0:temp3[5];
assign temp4[6] = dataB[4] ? 1'b0:temp3[6];
assign temp4[7] = dataB[4] ? 1'b0:temp3[7];
assign temp4[8] = dataB[4] ? 1'b0:temp3[8];
assign temp4[9] = dataB[4] ? 1'b0:temp3[9];
assign temp4[10] = dataB[4] ? 1'b0:temp3[10];
assign temp4[11] = dataB[4] ? 1'b0:temp3[11];
assign temp4[12] = dataB[4] ? 1'b0:temp3[12];
assign temp4[13] = dataB[4] ? 1'b0:temp3[13];
assign temp4[14] = dataB[4] ? 1'b0:temp3[14];
assign temp4[15] = dataB[4] ? 1'b0:temp3[15];
assign temp4[16] = dataB[4] ? temp3[0]:temp3[16];
assign temp4[17] = dataB[4] ? temp3[1]:temp3[17];
assign temp4[18] = dataB[4] ? temp3[2]:temp3[18];
assign temp4[19] = dataB[4] ? temp3[3]:temp3[19];
assign temp4[20] = dataB[4] ? temp3[4]:temp3[20];
assign temp4[21] = dataB[4] ? temp3[5]:temp3[21];
assign temp4[22] = dataB[4] ? temp3[6]:temp3[22];
assign temp4[23] = dataB[4] ? temp3[7]:temp3[23];
assign temp4[24] = dataB[4] ? temp3[8]:temp3[24];
assign temp4[25] = dataB[4] ? temp3[9]:temp3[25];
assign temp4[26] = dataB[4] ? temp3[10]:temp3[26];
assign temp4[27] = dataB[4] ? temp3[11]:temp3[27];
assign temp4[28] = dataB[4] ? temp3[12]:temp3[28];
assign temp4[29] = dataB[4] ? temp3[13]:temp3[29];
assign temp4[30] = dataB[4] ? temp3[14]:temp3[30];
assign temp4[31] = dataB[4] ? temp3[15]:temp3[31];

assign out = temp4;

endmodule
