<%-- 
    Document   : index
    Created on : May 7, 2015, 12:12:56 PM
    Author     : pc3
--%>

<%-- 
    Document   : index
    Created on : May 7, 2015, 12:12:56 PM
    Author     : pc3
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

    <div id="header">
            <h2><u>Encrypt-Decrypt</u></h2>
                        <h2><u>#######PikachuRPLK######</u></h2>
    </div>

    <div id="wrapper">
          <form id="enkripsiForm">
            <table border="0" cellpadding="5" cellspacing="0">
              <tr>
                <td><h3>Plaintext/Ciphertext:</h3></td>
                <td><textarea id="plaintext" cols="40" rows="7" placeholder="Masukkan Plaintext Atau Ciphertext here"></textarea></td>
              </tr>
              <tr>
                <td><h3>Key:</h3></td>
                <td><input type="text" id="key" placeholder="Masukkan Kunci" style="width:10em" /></td>
              </tr>
              <tr>
                <td></td>
                <td>
                    <input type="button" value="Encrypt" class="button" onclick="runEnkripsi(false);"/>
                    <input type="button" value="Decrypt" class="button" onclick="runEnkripsi(true);"/>
                </td>
                <td></td>
              </tr>
            </table>
          </form>
      </div>
      
      <script type="text/javascript">
      
        function runEnkripsi(isDecrypt){
            var shift = document.getElementById("key").value;
            var plaintext = document.getElementById("plaintext").value;
            
            if(plaintext.length==0){
                alert("Inputan Tidak Boleh Kosong");
                return;
        }
            var key = parseInt(shift, 10);
            if(key < 0 || key >= 26){
            alert("Range Kunci Anatara 1-25");
            return;
        }
            if(!/^-?\d+$/.test(shift)){
                alert("Kunci Haruslah Angka");
                return;
        }
        
        if (isDecrypt)
            key = (26 - key) % 26;
            var plaintext = document.getElementById("plaintext");
            plaintext.value = caesarShift(plaintext.value, key);
        
    }
        
        function caesarShift(text, shift) {
            var ciphertext = "";
            
            for (var i = 0; i < text.length; i++){
                var ch = text.charCodeAt(i);
                
                if(65 <= ch && ch <=  90) {
                    ciphertext += String.fromCharCode((ch - 65 + shift) % 26 + 65); // for Uppercase Unicode
                } 
                else if(97 <= ch && ch <= 122){
                    ciphertext += String.fromCharCode((ch - 97 + shift) % 26 + 97);  // for Lowercase Unicode
                }
                else{
                    ciphertext += text.charAt(i);
                }
        }
        return ciphertext;
    }  
      
      </script>
</body>

</html>