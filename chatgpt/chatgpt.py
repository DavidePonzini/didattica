import openai
from messages import Message

client = openai.OpenAI(api_key='your-api-key-here')

def generate_answer(messages: Message) -> str:
    response = client.chat.completions.create(
        model='gpt-4o-mini',
        messages=messages.messages
    )

    return response.choices[0].message.content
