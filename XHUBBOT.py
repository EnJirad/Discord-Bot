import discord
from discord.ext import commands
import requests
import logging
import asyncio

TTAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA = 'MTEyMDU1MTQyODM1MjY1MTMwNQ.GOASVK.iuoh030Z0IcnNzMnmFeIeAl9Qlwyjufl8zf5ds'

intents = discord.Intents.default()
intents.members = True
bot = commands.Bot(command_prefix='/', intents=intents)

logger = logging.getLogger('discord')
logger.setLevel(logging.DEBUG)
handler = logging.FileHandler(filename='bot.log', encoding='utf-8', mode='w')
handler.setFormatter(logging.Formatter(
    '%(asctime)s:%(levelname)s:%(name)s: %(message)s'))
logger.addHandler(handler)


@bot.event  
async def on_ready():
    print('Bot is ready.')  


@bot.event
async def on_command_error(ctx, error):  
    if isinstance(error, commands.CommandNotFound):
        return
    logger.exception(f"Error executing command: {error}")
    await ctx.send(f"An error occurred: {error}")


@bot.command()  
async def CheckID(ctx):
    guild = bot.get_guild(1088294110747693168)
    url = "https://raw.githubusercontent.com/EnJirad/KEYSYSTEM/main/Treasure-Quest-LIST-ID-DC"

    try:
        response = requests.get(url)
        response.raise_for_status()
        IDs = response.text.split("\n")

        for ID in IDs:
            ID = ID.strip()

            if not ID:
                continue
            member = guild.get_member(int(ID))
            if member is not None:
                await ctx.send(f'{ID} exists in the server.')
            else:
                await ctx.send(f'{ID} does not exist in the server.')

            await asyncio.sleep(1)

    except requests.exceptions.RequestException as e:
        logger.exception(f"Failed to fetch ID list: {e}")
        await ctx.send(f"Failed to fetch ID list: {e}")

bot.run(TTAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA)
