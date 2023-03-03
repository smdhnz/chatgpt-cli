# ChatGPT CLI

## 使い方

1. OpenAI APIのサイト(https://platform.openai.com/signup)でAPIキーを用意する

1. `.env`を作る

  ```sh
  cp .env.example .env
  ```

1. `.env`にAPIキーをぶちこむ

1. `yarn build:docker`でdockerでイメージを作る。

1. `yarn start`で実行

## 説明

実行ごとに会話はリセットされる。

出力はこんなかんじ、
```
🤔 :hey
🤖 :Hello there! How may I assist you today?
💸 :0.00004$
```

一番下の金額は、会話ごとのおおよその累積金額で、単位はドル
