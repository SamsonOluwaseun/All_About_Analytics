import streamlit as st
############# Section 4 Input widget for interactivity #####################
import pandas as pd

# Buttons
primary_btn = st.button(label="Primary", type= "primary")
secondary_btn = st.button(label="Secondary", type= "secondary")

if primary_btn:
    st.write("Hello from Primary")

if secondary_btn:
    st.write("Hello from Secondary")
# Now we can use the botton variables for decision, because it returns 
# boolean values when clicked "True"

# Checkbox
st.divider()
checkbox = st.checkbox("Remember me")

if checkbox:
    st.write("I will remember you")
else:
    st.write("I will forget you")

# Radio buttons "so that data read will have it
st.divider()
df= pd.read_csv("data/sample.csv")
radio= st.radio("Choose a column", options = df.columns[1:], index=0, horizontal= True)
st.write(radio)
# Selectbox
st.divider()
select= st.selectbox("Choose a column", options=df.columns[1:], index= 0)
st.write(select)

# Multiselect
st.divider()
multiselect= st.multiselect("Choose as many columns as you want", options= df.columns[1:], default=['col1'],max_selections=3)
st.write(multiselect)
# Slider
st.divider()
slider = st.slider("Pick a number", min_value=0, max_value=10, value= 5, step=1)
st.write(slider)

# Text Input For comments or messages
st.divider()
text_input= st.text_input("What's your name?", placeholder="Oluwaseun")
st.write(f"Your name is {text_input}")

# Number Input
st.divider()
num_input= st.number_input("Input a number", min_value=0, max_value=10, value=0)
st.write(f"Your inputed number is {num_input}")

# Text area
st.divider()
txt_area= st.text_area("What do you want to tell me?", height=200, placeholder="Write your message here")
st.write(txt_area)
