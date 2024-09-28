from langchain_huggingface import HuggingFaceEndpoint
import os
import re
import json

os.environ["HUGGINGFACEHUB_API_TOKEN"] = "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"
repo_id = "mistralai/Mistral-7B-Instruct-v0.3"
llm = HuggingFaceEndpoint(repo_id = repo_id, max_length = 128, temperature = 0.7, token = "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")

grade = 10
subject = "Mathematics"
no = 6

text = llm.invoke(f"Generate a quiz for grade {grade} of subject {subject} with {no} questions of level easy. Return the question and the options inside a python list.")

# Regex to capture everything between the outermost curly braces
matches = re.findall(r'\{[^}]*\}', text, re.DOTALL)

my_list = []
for i in matches:
    text = i
    # Clean the text to make it a valid JSON string
    cleaned_text = text.strip("['\"]")  # Removes [' at the start and '] at the end
    cleaned_text = cleaned_text.replace('\n', '').replace('    ', '').strip()  # Removes newlines and extra spaces

    # Replace single quotes with double quotes to make it valid JSON
    cleaned_text = text.replace("'", '"')

    # Convert the cleaned string to a dictionary
    dictionary = json.loads(cleaned_text)

    # Check the result
    my_list.append(dictionary) # Should print <class 'dict'>
my_list