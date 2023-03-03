import { Configuration, OpenAIApi } from "openai";
import { question, echo } from "zx";

const config = new Configuration({
  apiKey: process.env.API_KEY as string,
});

const api = new OpenAIApi(config);

const messages: {
  role: "system" | "user" | "assistant";
  content: string;
}[] = [];

const prices: number[] = [];

(async () => {
  while (true) {
    let content = await question("🤔 :");

    messages.push({ role: "user", content });

    const res = await api.createChatCompletion({
      model: "gpt-3.5-turbo",
      messages,
    });

    prices.push((0.002 * (res.data.usage?.total_tokens ?? 0)) / 1000);

    echo(`🤖 :${res.data.choices[0]?.message?.content.replace(/\r?\n/g, "")}`);
    echo(`💸 :${prices.reduce((x, y) => x + y)}$\n`);
  }
})();
