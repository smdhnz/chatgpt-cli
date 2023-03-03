# ChatGPT CLI

## 依存環境

- docker
- yarn (なくてもいい)

## 使い方

1. `git clone https://github.com/smdhnz/chatgpt-cli.git && cd chatgpt-cli`

1. OpenAI APIのサイト( https://platform.openai.com/overview )でAPIキーを用意する

1. `cp .env.example .env`で`.env`を作る

1. `.env`にAPIキーをぶちこむ

1. `yarn build:docker`でdockerでイメージを作る。(yarnなければ`docker build -t chatgpt-cli:latest .`)

1. `yarn start`で実行(yarnなければ`docker run --env-file=.env --rm -it chatgpt-cli:latest`)

## 説明

実行ごとに会話はリセットされる。

出力はこんなかんじ、
```
🤔 :hey
🤖 :Hello there! How may I assist you today?
💸 :0.00004$
```

一番下の金額は、会話ごとのおおよその累積金額で、単位はドル

ちなみに、OpenAIのアカウント作ってから18ドルまでは無料(2023年3月3日時点)
