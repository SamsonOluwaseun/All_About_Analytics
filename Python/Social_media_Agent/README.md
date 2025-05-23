# Social Media Content Generator

A Streamlit application that generates social media posts from YouTube video transcripts using AI.

## Features

- Generate social media content for different platforms (LinkedIn, Twitter, Facebook, Instagram, TikTok)
- Support for multiple AI platforms with easy selection:
  - OpenAI (GPT-3.5-Turbo, GPT-4, GPT-4-Turbo)
  - Google Gemini (Gemini-Pro, Gemini-1.5-Pro)
  - DeepSeek (DeepSeek-Chat, DeepSeek-Coder)
- Dynamic model selection based on chosen AI platform
- Streamlined API key management in the sidebar
- Customizable content generation with specific instructions
- Preview of video transcript
- Easy copy-paste of generated content
- Helpful information about each AI platform

## Installation

1. Clone this repository
2. Install the required dependencies:
   ```
   pip install -r requirements.txt
   ```
3. Create a `.env` file in the root directory with your API keys:
   ```
   OPENAI_API_KEY=your_openai_api_key
   GOOGLE_API_KEY=your_google_api_key
   DEEPSEEK_API_KEY=your_deepseek_api_key
   ```

## Usage

1. Run the Streamlit app:
   ```
   streamlit run app.py
   ```
2. Open your browser and navigate to the URL displayed in the terminal (usually http://localhost:8501)
3. In the sidebar:
   - Select your preferred AI platform (OpenAI, Gemini, or DeepSeek)
   - Enter your API key for the selected platform
4. In the main form:
   - Enter a YouTube video ID (the part after `v=` in a YouTube URL)
   - Select your preferred social media platform
   - Choose a model from the options available for your selected AI platform
   - Add any custom instructions
5. Click "Generate Content"
6. Review the generated content and copy it for use on your social media platform

## How It Works

The application:
1. Retrieves the transcript from the specified YouTube video
2. Processes the transcript using the selected AI model
3. Generates social media content tailored to the chosen platform
4. Displays the result in a user-friendly format

## API Keys and Platform Selection

The app now features an improved interface for managing AI platforms and API keys:

- **Platform Selection**: Choose your preferred AI platform (OpenAI, Gemini, or DeepSeek) in the sidebar
- **API Key Management**: The app will dynamically show the appropriate API key field based on your selection
- **Model Options**: Available models will update automatically based on the selected platform
- **Helpful Resources**: Links to obtain API keys are provided for each platform

If you don't have API keys for all platforms, you can still use the app:
- Select only the AI platform for which you have a valid API key
- Enter your API key in the corresponding field in the sidebar
- Alternatively, add your API keys to the .env file for persistent storage

## Troubleshooting

- **Error retrieving transcript**: Make sure the video ID is correct and the video has available transcripts
- **API key errors**: Verify that you've entered the correct API keys in the sidebar or .env file
- **Generation errors**: Some videos may have transcripts that are too long or in formats that are difficult to process

## License

This project is open source and available under the MIT License.
