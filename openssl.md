* http://stuff-things.net/2007/06/11/encrypting-sensitive-data-with-ruby-on-rails
* http://en.wikipedia.org/wiki/Public-key_cryptography

# generate a 2048 bit private key

    openssl genrsa -des3 -out pr.smp 2048

# extract the public key

    openssl rsa -in pr.smp -out pu.smp -outform PEM -pubout

**note**: you can not use this method to encrypt anything larger than the key size minus 11 bytes of overhead (padding). In this case we have a 2048 bit key which gives 256 - 11 = 245 bytes.

# encode BASE 64

    openssl base64 -in myfile -out myfile.b64

# decode BASE 64

    openssl base64 -d -in myfile.b64 -out myfile.decrypt


# encrypt USING A TYPED-IN PASSWORD:

    openssl des3 -salt -in file.txt -out file.des3 (prompt for password twice)
    openssl des3 -salt -in file.txt -out file.des3 -k mypassword (no prompt)

# decrypt USING A TYPED-IN PASSWORD:

    openssl des3 -d -salt -in file.des3 -out file.txt (prompt for password)
    openssl des3 -d -salt -in file.des3 -out file.txt -k mypassword (no prompt)

# ENCRYPT/DECRYPT USING A KEYFILE:

## generate a 1024-bit RSA private key

    openssl genrsa -des3 -out smp.key 1024

## encrypt

    openssl des3 -salt -in temp.pl -out temp.txt.des3 -kfile smp.key

## decrypt

    openssl des3 -d -salt -in temp.txt.des3 -out temp.decrypt.pl -kfile smp.key

# encrypt in ruby using public key

``` ruby
require 'openssl'  
require 'base64'  

public_key_file = 'pu.smp';  
string = 'Hello World!';  

public_key = OpenSSL::PKey::RSA.new(File.read(public_key_file))  
encrypted_string = Base64.encode64(public_key.public_encrypt(string))  

puts encrypted_string
```

# decrypt in ruby using private key

``` ruby
require 'openssl'  
require 'base64'  

private_key_file = 'pr.smp';  
password = 'boost facile'  

encrypted_string = %Q{  
qBF3gjF8iKhDh+g+TOvAzBkJA/1d2lD8RUyz2Ol+s1OpLB5aA3RA7EHm0KGL  
XaP3upvJ7I5rN1yO9Qat9kyRQu9OMqAUmFvwUaiW/1NPjxnpmcFn9mhkttP9  
qfO6iIfyxErUqKIxHYqavyPmivre9eEcXiBdtIK6NJJKG3WmSfIFgpZ6eBWI  
wxlZg+x0fI4L2JsODMGx5Khn7CUt0bTkH6HMHwxEG24NbsmrqtC2zn8Hm/87  
UyN5ZCDyJ/mtIHAjzPry6vbVPTF0QCR4lZ7uSt/W7JZ0tNgX7eQQwoPCgbqU  
/uwRCwww/c407jw7YEE5Lgpx20/jyLXJwvZHxNEcxA==  
}

private_key = OpenSSL::PKey::RSA.new(File.read(private_key_file),password)  
string = private_key.private_decrypt(Base64.decode64(encrypted_string))  
puts string
```

# SUPPORTED CIPHERS

<pre>
 base64             Base 64

 bf-cbc             Blowfish in CBC mode
 bf                 Alias for bf-cbc
 bf-cfb             Blowfish in CFB mode
 bf-ecb             Blowfish in ECB mode
 bf-ofb             Blowfish in OFB mode

 cast-cbc           CAST in CBC mode
 cast               Alias for cast-cbc
 cast5-cbc          CAST5 in CBC mode
 cast5-cfb          CAST5 in CFB mode
 cast5-ecb          CAST5 in ECB mode
 cast5-ofb          CAST5 in OFB mode

 des-cbc            DES in CBC mode
 des                Alias for des-cbc
 des-cfb            DES in CBC mode
 des-ofb            DES in OFB mode
 des-ecb            DES in ECB mode

 des-ede-cbc        Two key triple DES EDE in CBC mode
 des-ede            Alias for des-ede
 des-ede-cfb        Two key triple DES EDE in CFB mode
 des-ede-ofb        Two key triple DES EDE in OFB mode

 des-ede3-cbc       Three key triple DES EDE in CBC mode
 des-ede3           Alias for des-ede3-cbc
 des3               Alias for des-ede3-cbc
 des-ede3-cfb       Three key triple DES EDE CFB mode
 des-ede3-ofb       Three key triple DES EDE in OFB mode

 desx               DESX algorithm.

 idea-cbc           IDEA algorithm in CBC mode
 idea               same as idea-cbc
 idea-cfb           IDEA in CFB mode
 idea-ecb           IDEA in ECB mode
 idea-ofb           IDEA in OFB mode

 rc2-cbc            128 bit RC2 in CBC mode
 rc2                Alias for rc2-cbc
 rc2-cfb            128 bit RC2 in CBC mode
 rc2-ecb            128 bit RC2 in CBC mode
 rc2-ofb            128 bit RC2 in CBC mode
 rc2-64-cbc         64 bit RC2 in CBC mode
 rc2-40-cbc         40 bit RC2 in CBC mode

 rc4                128 bit RC4
 rc4-64             64 bit RC4
 rc4-40             40 bit RC4

 rc5-cbc            RC5 cipher in CBC mode
 rc5                Alias for rc5-cbc
 rc5-cfb            RC5 cipher in CBC mode
 rc5-ecb            RC5 cipher in CBC mode
 rc5-ofb            RC5 cipher in CBC mode
