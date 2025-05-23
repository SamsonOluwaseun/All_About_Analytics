import os
import asyncio
import streamlit as st
from dotenv import load_dotenv
from social_media_agent import generate_social_media_posts_langchain, get_transcript

# Load environment variables
load_dotenv()

# Set page configuration
st.set_page_config(
    page_title="Social Media Content Generator",
    page_icon="📱",
    layout="wide"
)

# App title and description
st.title("📱 Social Media Content Generator")
st.markdown("""
This app generates social media posts from YouTube video transcripts using AI.
Enter a YouTube video ID, select your preferences, and get AI-generated content!
""")

# Sidebar for API keys and platform selection
st.sidebar.title("AI Platform Settings")
st.sidebar.markdown("Select your AI platform and provide the API key")

# AI Platform selection in sidebar
ai_platform = st.sidebar.selectbox(
    "AI Platform",
    options=["OpenAI", "Gemini", "Deepseek"],
    help="Select the AI platform you want to use for content generation"
)

# Get API keys from environment or let user input them based on selected platform
if ai_platform == "OpenAI":
    api_key = st.sidebar.text_input("OpenAI API Key", value=os.getenv("OPENAI_API_KEY", ""), type="password",
                                    help="Enter your OpenAI API key or set OPENAI_API_KEY in your .env file")
    st.sidebar.markdown("Get your API key from [OpenAI](https://platform.openai.com/api-keys)")
elif ai_platform == "Gemini":
    api_key = st.sidebar.text_input("Google Gemini API Key", value=os.getenv("GOOGLE_API_KEY", ""), type="password",
                                   help="Enter your Google API key or set GOOGLE_API_KEY in your .env file")
    st.sidebar.markdown("Get your API key from [Google AI Studio](https://makersuite.google.com/app/apikey)")
else:  # DeepSeek
    api_key = st.sidebar.text_input("DeepSeek API Key", value=os.getenv("DEEPSEEK_API_KEY", ""), type="password",
                                   help="Enter your DeepSeek API key or set DEEPSEEK_API_KEY in your .env file")
    st.sidebar.markdown("Get your API key from [DeepSeek](https://platform.deepseek.com/api-keys)")

# For backward compatibility, still define these variables
openai_api_key = os.getenv("OPENAI_API_KEY", "")
gemini_api_key = os.getenv("GOOGLE_API_KEY", "")
deepseek_api_key = os.getenv("DEEPSEEK_API_KEY", "")

# Main form
with st.form("generation_form"):
    # YouTube video ID input
    video_id = st.text_input(
        "YouTube Video ID",
        help="Enter the ID of a YouTube video (e.g., 'MqHPwGRTkTQ' from https://www.youtube.com/watch?v=MqHPwGRTkTQ)"
    )

    # Create columns for form inputs
    col1, col2 = st.columns(2)

    # Column 1: Platform selection
    with col1:
        platform = st.selectbox(
            "Social Media Platform",
            options=["LinkedIn", "Twitter", "Facebook", "Instagram", "TikTok"]
        )

        # Display the selected AI platform (read-only, since it's selected in sidebar)
        st.info(f"Selected AI Platform: {ai_platform}")

    # Column 2: Model selection and custom instructions
    with col2:
        # Dynamic model options based on selected AI platform
        if ai_platform == "OpenAI":
            model_options = ["gpt-3.5-turbo", "gpt-4", "gpt-4-turbo"]
            model_help = "Select an OpenAI model. GPT-4 models are more capable but may cost more."
        elif ai_platform == "Gemini":
            model_options = ["gemini-pro", "gemini-1.5-pro"]
            model_help = "Select a Google Gemini model. Gemini-1.5-Pro is more advanced but may have limited availability."
        else:  # DeepSeek
            model_options = ["deepseek-chat", "deepseek-coder"]
            model_help = "Select a DeepSeek model. DeepSeek-coder is optimized for code-related content."

        model_name = st.selectbox("Model", options=model_options, help=model_help)

        custom_instructions = st.text_area(
            "Custom Instructions",
            placeholder="E.g., 'Keep it professional with bullet points' or 'Add relevant hashtags'"
        )

    # Submit button
    submit_button = st.form_submit_button("Generate Content")

# Function to run async code
def run_async_generation(video_id, platform, ai_platform, api_key, model_name, custom_instructions):
    loop = asyncio.new_event_loop()
    asyncio.set_event_loop(loop)
    result = loop.run_until_complete(
        generate_social_media_posts_langchain(
            video_id=video_id,
            social_media_platform=platform,
            ai_platform=ai_platform,
            api_key=api_key,
            model_name=model_name,
            custom_instructions=custom_instructions
        )
    )
    loop.close()
    return result

# Process form submission
if submit_button:
    if not video_id:
        st.error("Please enter a YouTube Video ID")
    else:
        # API key is already selected in the sidebar based on the chosen AI platform

        if not api_key:
            st.error(f"Please provide an API key for {ai_platform} in the sidebar")
            st.info(f"You can either enter your {ai_platform} API key directly in the sidebar or add it to your .env file")
        else:
            with st.spinner(f"Generating {platform} post using {ai_platform} ({model_name})..."):
                try:
                    # First, try to get the transcript to show a preview
                    try:
                        transcript = get_transcript(video_id)
                        with st.expander("Video Transcript"):
                            st.text(transcript[:1000] + ("..." if len(transcript) > 1000 else ""))
                    except Exception as e:
                        st.error(f"Error retrieving transcript: {str(e)}")
                        st.stop()

                    # Generate the content
                    result = run_async_generation(
                        video_id=video_id,
                        platform=platform,
                        ai_platform=ai_platform,
                        api_key=api_key,
                        model_name=model_name,
                        custom_instructions=custom_instructions
                    )

                    # Display the result
                    st.success("Content generated successfully!")
                    st.subheader(f"{platform} Post ({ai_platform})")
                    st.markdown(result)

                    # Add copy button
                    st.text_area("Copy your content", value=result, height=200)

                except Exception as e:
                    st.error(f"Error: {str(e)}")

# Footer
st.markdown("---")
st.markdown("Made with ❤️ using Streamlit and LangChain")

# Add helpful information about the AI platforms
with st.expander("About AI Platforms"):
    st.markdown("""
    ### OpenAI
    - **Models**: GPT-3.5-Turbo, GPT-4, GPT-4-Turbo
    - **Strengths**: Excellent general-purpose text generation, strong reasoning capabilities
    - **API**: Requires an OpenAI API key

    ### Google Gemini
    - **Models**: Gemini-Pro, Gemini-1.5-Pro
    - **Strengths**: Good multimodal capabilities, competitive performance
    - **API**: Requires a Google API key

    ### DeepSeek
    - **Models**: DeepSeek-Chat, DeepSeek-Coder
    - **Strengths**: Specialized models for different use cases, competitive pricing
    - **API**: Requires a DeepSeek API key
    """)

    st.info("Select your preferred AI platform in the sidebar, then provide the corresponding API key.")
