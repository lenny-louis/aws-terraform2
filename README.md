# aws-terraform2

TP aws-terraform

premier TP :

j'ai tout d'abord créer la clef paire (firstkeypair)
j'ai créer une instance ubuntu 18.03
je me suis connecter en ssh ubuntu@IP
j'ai effectué l'installation :
sudo apt update
sudo apt install nginx
systemctl status nginx 
je fais un curl de mon localhost :
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>

le site peux être visité sous http://3.86.24.13/

