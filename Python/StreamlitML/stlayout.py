import streamlit as st
import pandas as pd

###################### Section 6 ########################
################ Layouts Elements #################

# Sidebar
with st.sidebar:
    st.write("Text in the sidebar")

# Columns
col1, col2, col3 = st.columns(3)
col1.write("Text in a column")
slider=col2.slider("choose a number", min_value=0, max_value=10)
col3.metric(label= "Selected value", value=slider, delta= 20, delta_color="normal")


# Tabs
df= pd.read_csv("data/sample.csv")
tab1, tab2 = st.tabs(["Line plot","Bar plot"])
with tab1:
    tab1.write("A line plot")
    st.line_chart(df, x="year", y=["col1","col2","col3"])

with tab2:
    tab2.write("A bar plot")
    st.bar_chart(df, x="year", y=["col1","col2","col3"])

# Expander (collapsible emement for more information)
with st.expander("Click to expand"):
    st.write("I am the text that you only see when you expand")

# Container For grouping elements in Streamlit
with st.container():
    st.write("This is inside the container")

st.write("This is outsideside the container")