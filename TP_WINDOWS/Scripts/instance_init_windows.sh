net user lenny /add /y
net user lenny password77
net localgroup administrators lenny /add
echo ${base64encode(file("./test.txt"))} > tmp2.b64 && certutil -decode tmp2.b64 C:/test.txt

