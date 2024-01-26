import streamlit as st

################# Session 5 Forms #######################################
################ Forms using multiple object into single form#################
with st.form("form_key"):
    st.write("What would you like to order")
    appetizer = st.selectbox("Appetizer", options=["choice1","Choice2", "Choice3"])
    main = st.selectbox("Main course", options=["choice1","Choice2", "Choice3"])
    dessert = st.selectbox("Dessert", options=["choice1","Choice2", "Choice3"])

    wine= st.checkbox("Are you bringing wine?")

    visit_date=st.date_input("When are you coming?")

    visit_time =st.time_input("At what time are you comming?")

    allergies = st.text_area("Any allergies?", placeholder= "Leave us a note for allergies")
    
    submit_btn= st.form_submit_button("Submit")

st.write(f""" Your order summary:
         
Appetizer: {appetizer}

Main course: {main}

Dessert: {dessert}

Are you bringing your own wine: {"yes" if wine else "no"}

Date of visit: {visit_date}

Time of visit: {visit_time}

Allergies: {allergies}

""")