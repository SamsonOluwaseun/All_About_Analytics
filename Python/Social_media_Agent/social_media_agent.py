import os
import asyncio
from dotenv import load_dotenv
from typing import List, Optional
import json  # Import json for JSONDecodeError

# LangChain Imports
from langchain_core.prompts import ChatPromptTemplate
from langchain_core.output_parsers import StrOutputParser
from langchain_openai import ChatOpenAI
from langchain_google_genai import ChatGoogleGenerativeAI
from langchain_community.llms import OpenAI as LegacyOpenAI_LLM  # For DeepSeek's base_url compatibility if needed

# YouTube Transcript API
from youtube_transcript_api import YouTubeTranscriptApi

# Load environment variables from .env file
load_dotenv()


# --- Helper Function: Get YouTube Transcript ---
def get_transcript(video_id: str, languages: list = None) -> str:
    """
    Retrieves the transcript for a YouTube video.

    Args:
        video_id (str): The YouTube video ID.
        languages (list, optional): List of language codes to try, in order of preference.
                                   Defaults to ["en"] if None.

    Returns:
        str: The concatenated transcript text.

    Raises:
        Exception: If transcript retrieval fails, with details about the failure.
    """
    if languages is None:
        languages = ["en"]

    try:
        # Use the Youtube transcript API
        ytt_api = YouTubeTranscriptApi()
        fetched_transcript = ytt_api.fetch(video_id, languages=languages)

        # More efficient way to concatenate all text snippets
        transcript_text = " ".join(snippet.text for snippet in fetched_transcript)

        return transcript_text

    except Exception as e:
        # Handle specific YouTube transcript API exceptions
        from youtube_transcript_api._errors import (
            CouldNotRetrieveTranscript,
            VideoUnavailable,
            InvalidVideoId,
            NoTranscriptFound,
            TranscriptsDisabled
        )

        if isinstance(e, NoTranscriptFound):
            error_msg = f"No transcript found for video {video_id} in languages: {languages}"
        elif isinstance(e, VideoUnavailable):
            error_msg = f"Video {video_id} is unavailable"
        elif isinstance(e, InvalidVideoId):
            error_msg = f"Invalid video ID: {video_id}"
        elif isinstance(e, TranscriptsDisabled):
            error_msg = f"Transcripts are disabled for video {video_id}"
        elif isinstance(e, CouldNotRetrieveTranscript):
            error_msg = f"Could not retrieve transcript: {str(e)}"
        else:
            error_msg = f"An unexpected error occurred: {str(e)}"

        print(f"Error: {error_msg}")
        raise Exception(error_msg) from e




# --- Main LangChain Integration Function ---
async def generate_social_media_posts_langchain(
        video_id: str,
        social_media_platform: str,
        ai_platform: str,
        api_key: str,
        model_name: str,
        custom_instructions: Optional[str] = None
) -> str:
    """
    Generates a social media post for a given platform from a YouTube video transcript using LangChain.

    Args:
        video_id (str): The YouTube video ID.
        social_media_platform (str): The target social media platform (e.g., "LinkedIn", "Twitter").
        ai_platform (str): The AI platform to use ("OpenAI", "Gemini", "Deepseek").
        api_key (str): The API key for the selected AI platform.
        model_name (str): The specific model name to use (e.g., "gpt-3.5-turbo", "gemini-pro", "deepseek-chat").
        custom_instructions (str, optional): Additional instructions for content generation.

    Returns:
        str: The generated social media post.
    """
    print(f"Generating post for {social_media_platform} using {ai_platform} ({model_name})...")

    # 1. Fetch Transcript
    try:
        transcript = get_transcript(video_id)
    except Exception as e:
        return f"Error fetching transcript: {e}"

    # 2. Configure LLM based on selected platform
    llm = None
    if ai_platform.lower() == "openai":
        if not api_key:
            raise ValueError("OpenAI API key is missing.")
        llm = ChatOpenAI(api_key=api_key, model=model_name, temperature=0.7)
    elif ai_platform.lower() == "gemini":
        if not api_key:
            raise ValueError("Google Gemini API key is missing.")
        # Note: ChatGoogleGenerativeAI typically uses GOOGLE_API_KEY env var
        # but can be configured directly.
        llm = ChatGoogleGenerativeAI(google_api_key=api_key, model=model_name, temperature=0.7)
    elif ai_platform.lower() == "deepseek":
        if not api_key:
            raise ValueError("Deepseek API key is missing.")
        # DeepSeek often uses an OpenAI-compatible API
        # We use ChatOpenAI and override the base_url
        llm = ChatOpenAI(
            api_key=api_key,
            base_url="https://api.deepseek.com/v1",  # DeepSeek's API endpoint
            model=model_name,
            temperature=0.7
        )
    else:
        raise ValueError(f"Unsupported AI Platform: {ai_platform}")

    if llm is None:
        raise ValueError("LLM could not be configured. Check AI platform and API key.")

    # 3. Define Prompt Template
    template_parts = [
        ("system", "You are a highly engaging and concise social media content writer."),
        ("human", "Generate a social media post for {platform} based on the following video transcript."),
        ("human", "Transcript: {transcript}"),
        ("human",
         "Ensure the post is engaging, informative, and includes relevant hashtags. Keep it concise and suitable for {platform}.")
    ]

    if custom_instructions:
        template_parts.append(("human", "Additional instructions: {custom_instructions}"))

    prompt = ChatPromptTemplate.from_messages(template_parts)

    # 4. Create the Chain
    # Combine prompt, LLM, and output parser
    chain = prompt | llm | StrOutputParser()

    # 5. Invoke the Chain
    try:
        response = await chain.ainvoke({
            "platform": social_media_platform,
            "transcript": transcript,
            "custom_instructions": custom_instructions
        })
        return response
    except Exception as e:
        return f"Error generating content with LangChain: {e}"


# --- Example Usage (Main Execution Block) ---
async def main():
    # Example YouTube Video ID (replace with one that has a transcript)
    # This is a sample video ID for testing.
    # Make sure to pick a video that has an English transcript available.
    example_video_id = "MqHPwGRTkTQ"  # Example: A TED Talk or similar.

    print(f"--- Generating social media posts for video ID: {example_video_id} ---")

    # --- Example 1: Using OpenAI ---
    openai_api_key = os.getenv("OPENAI_API_KEY")
    if openai_api_key:
        print("\nAttempting to generate with OpenAI...")
        post_openai = await generate_social_media_posts_langchain(
            video_id=example_video_id,
            social_media_platform="LinkedIn",
            ai_platform="OpenAI",
            api_key=openai_api_key,
            model_name="gpt-3.5-turbo",  # Or "gpt-4"
            custom_instructions="Focus on key takeaways for professionals."
        )
        print(f"LinkedIn Post (OpenAI):\n{post_openai}\n")
    else:
        print("\nSkipping OpenAI example: OPENAI_API_KEY not found in environment variables.")

    # --- Example 2: Using Google Gemini ---
    gemini_api_key = os.getenv("GOOGLE_API_KEY")  # Ensure this is GOOGLE_API_KEY
    if gemini_api_key:
        print("\nAttempting to generate with Gemini...")
        post_gemini = await generate_social_media_posts_langchain(
            video_id=example_video_id,
            social_media_platform="Twitter",
            ai_platform="Gemini",
            api_key=gemini_api_key,
            model_name="gemini-pro",  # Or "gemini-1.5-pro" if you have access
            custom_instructions="Keep it under 280 characters with relevant emojis."
        )
        print(f"Twitter Post (Gemini):\n{post_gemini}\n")
    else:
        print("\nSkipping Gemini example: GOOGLE_API_KEY not found in environment variables.")

    # --- Example 3: Using DeepSeek ---
    deepseek_api_key = os.getenv("DEEPSEEK_API_KEY")
    if deepseek_api_key:
        print("\nAttempting to generate with DeepSeek...")
        post_deepseek = await generate_social_media_posts_langchain(
            video_id=example_video_id,
            social_media_platform="Facebook",
            ai_platform="Deepseek",
            api_key=deepseek_api_key,
            model_name="deepseek-chat",  # Or "deepseek-coder"
            custom_instructions="Make it friendly and encourage comments."
        )
        print(f"Facebook Post (DeepSeek):\n{post_deepseek}\n")
    else:
        print("\nSkipping DeepSeek example: DEEPSEEK_API_KEY not found in environment variables.")


if __name__ == "__main__":
    asyncio.run(main())

