FROM node:22-slim
WORKDIR /app

COPY package*.json ./
COPY server ./server
COPY public ./public
COPY template ./template

# template yo'q bo'lsa build shu yerda aniq xabar bilan to'xtaydi
RUN test -f template/al-kundalik/server/db.js || (echo "XATO: template/al-kundalik/server/db.js repo'da yo'q" && ls -la /app /app/template && exit 1)

RUN npm run build

ENV NODE_ENV=production
# vaqtincha tashxis: ishga tushishda papkalarni log'ga chiqaradi
CMD ["sh", "-c", "echo '--- /app/template:' && ls /app/template && npm start"]
