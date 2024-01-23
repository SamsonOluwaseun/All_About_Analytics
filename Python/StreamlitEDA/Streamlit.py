import streamlit as st
import pandas as pd
import plotly.express as px
import numpy as np

st.markdown("""This app performs EDA 
            ** Python Libraries:** streamlit, pandas,...""")

# Creating a button for uploading files
new_file= st.file_uploader("upload a file", type="csv")

# Check if file was successfuly uploaded
if new_file is not None:
    data=pd.read_csv(new_file)
    obj=[]
    int_float=[]
    for i in data.columns:
        clas=data[i].dtypes
        if clas == 'object':
            obj.append(i)
        else:
            int_float.append(i)

# Adding Submit Button Sidebar
with st.form(key='my_form'):
    with st.sidebar:
        st.sidebar.header("To remove Null Values press below button")
        submit_button=st.form_submit_button(label='Remove Null')
# If we click Remove Null button Null values will be replace with mean and mode
if submit_button:
    for i in data.columns:
        clas=data[i].dtype
        if clas =='object':
            data[i].fillna(data[i].model()[0], inplace= True)
        else:
            data[i].fillna(data[i].mean(),inplace=True)

# Finding number of null values in each column
lis=[]
for i in data.columns:
    dd= sum(pd.isnull(data[i]))
    lis.append(dd)

#If No of null values are zero it will display some text else it will display bar plot by each column
if max(lis)== 0:
    st.write("Bar plot to know no.of Null values in each column")
    st.write("Total no.of Null Values"+ str(sum(lis)))
    fig2= px.bar(x=data.columns, y=lis, label={'x':"Column Names", 'y':"No. of Null Values"})
    st.plotly_chart(fig2)

# Frequency Plot
st.sidebar.header("Select Variable")
selected_pos= st.sidebar.selectbox('Object Variables',obj)
st.write("Bar Plot to know frequency of each category")
frequency_data = data[selected_pos].value_counts()
fig = px.bar(frequency_data, x=frequency_data.index, y= selected_pos, labels={'x':selected_pos, 'y':'count'})
st.plotly_chart(fig)

# Histogram
st.sidebar.header("Select Variable")
selected_pos1=st.sidebar.selectbox('int or float Variables',int_float)
st.write("Bar Plot to know count of values based on range")
counts, bins=np.histogram(data[selected_pos1], bins=range(int(min(data[selected_pos1])/10)))
bins = 0.5 * (bins[:-1] + bins[1:])
fig1 = px.bar(x=bins, y=counts, labels = {'x': selected_pos1, 'y':'count'})
st.plotly_chart(fig1)

# Correlation Charts
st.sidebar.header("Select Variable")
selected_pos2 = st.sidebar.multiselect('Int or Float Variables-Correlation',int_float)
st.write("Scatter Plot for Correlation")
if len(selected_pos2) == 2:
    fig3= px.scatter(data, x=selected_pos2[0],y=selected_pos2[1])
    st.plotly_chart(fig3)
else:
    st.write("Please select Two Variables")