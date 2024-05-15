
module m41(out, AND, OR, SUM, SLT, s0, s1);
  output out; 
  input AND, OR, SUM, SLT, s0, s1;
  wire s0bar, s1bar, T1, T2, T3, T4;
  
  not (s0bar, s0), (s1bar, s1);
  and (T1, AND, s0bar, s1bar), (T2, OR, s0bar, s1), (T3, SUM, s0, s1bar), (T4, SLT, s0, s1);
  or(out, T1, T2, T3, T4);
  
endmodule