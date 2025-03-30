
# 🔒 Apache HTTP/2 con HTTPS en Docker

Este proyecto levanta un servidor web **Apache** en un contenedor Docker, configurado con:

- ✅ HTTPS usando un certificado autofirmado
- 🚀 Soporte para el protocolo **HTTP/2**
- 🏠 Una página simple (`home.html`) con datos personales, servida de forma segura

Ideal para entornos de desarrollo, prácticas de redes, servidores web o materias de sistemas operativos.

---

## 📁 Estructura del proyecto

```
apache-http2-docker/
├── Dockerfile
├── default.conf
├── ssl/
│   ├── selfsigned.crt
│   └── selfsigned.key
└── html/
    └── home.html
```

---

## 🧱 Requisitos

- Docker instalado y corriendo en tu sistema
- Puerto **443** libre

---

## 🚀 Instrucciones de uso

### 1. Clonar el repositorio

```bash
git clone https://github.com/tu-usuario/apache-http2-docker.git
cd apache-http2-docker
```

### 2. Generar el certificado autofirmado (si no está creado)

```bash
mkdir -p ssl

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout ssl/selfsigned.key \
-out ssl/selfsigned.crt \
-subj "/C=AR/ST=BuenosAires/L=BuenosAires/O=SOLUTEC/CN=localhost"
```

### 3. Construir la imagen de Docker

```bash
docker build -t apache-http2 .
```

### 4. Correr el contenedor

```bash
docker run -d -p 443:443 --name apache-http2 apache-http2
```

---

## 🌍 Acceso al sitio

Abrí tu navegador y entrá en:

```
https://localhost/home.html
```

🔒 Aceptá el certificado autofirmado si el navegador lanza advertencia de seguridad (es normal en entornos de desarrollo).

---

## ✅ Verificar HTTP/2

Desde consola:

```bash
curl -I --http2 https://localhost/home.html --insecure
```

Deberías ver en la respuesta:

```
HTTP/2 200
```

---

## 🙋‍♂️ Contacto

Desarrollado por **Fernando Tejerina**  
📨 [Conectá conmigo en LinkedIn](https://www.linkedin.com/in/fertejj)  
🔧 Proyecto educativo para prácticas con servidores web, HTTPS y Docker.

---

## ⚠️ Notas

- Este proyecto es para **uso educativo/desarrollo**. No usar certificados autofirmados en producción.
- Probado en Ubuntu + Docker Desktop. También funciona en Windows/Mac si se tiene Docker correctamente instalado.
```
