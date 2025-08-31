#!/usr/bin/env python

from browser_use import Agent, ChatOpenAI, ChatGoogle, ChatAnthropic
from dotenv import load_dotenv
import asyncio
import sys

load_dotenv()


async def main():
    #llm = ChatOpenAI(model="gpt-4.1-mini")		# OPENAI_API_KEY
    #llm = ChatAnthropic(model="claude-sonnet-4-0")	# ANTHROPIC_API_KEY
    llm = ChatGoogle(model='gemini-2.5-flash')		# GOOGLE_API_KEY
    task = sys.argv[1]
    agent = Agent(task=task, llm=llm)
    await agent.run()

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Provide the prompt as an argument")
        sys.exit(1)

    asyncio.run(main())

