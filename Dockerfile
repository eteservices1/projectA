FROM node:12.16.1
WORKDIR /app

COPY .ssh/ /root/.ssh
RUN  echo "    IdentityFile ~/.ssh/id_rsa.pub" >> /etc/ssh/ssh_config

COPY package.json .
COPY package-lock.json .

RUN ssh -vT git@github.com

COPY . .

EXPOSE 3000

CMD ["npm", "run", "dev"]