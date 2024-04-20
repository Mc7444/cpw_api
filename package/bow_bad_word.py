base_path = "bad_word_txt/"
# Open the text file

with open(base_path+"high.txt", "r", encoding="utf-8") as file:
    # Read the lines and remove any leading or trailing whitespace
    high = [line.strip() for line in file]

with open(base_path+"medium.txt", "r", encoding="utf-8") as file:
    # Read the lines and remove any leading or trailing whitespace
    medium = [line.strip() for line in file]

with open(base_path+"low.txt", "r", encoding="utf-8") as file:
    # Read the lines and remove any leading or trailing whitespace
    low = [line.strip() for line in file]
    
with open(base_path+"profanities.txt", "r", encoding="utf-8") as file:
    # Read the lines and remove any leading or trailing whitespace
    bad_eng = [line.strip() for line in file]

#Build bad word list
bad_word_list = set(high+medium+low+bad_eng)

def find_bad_word_in_string(text):
    for word in bad_word_list:
        if word in text:
            return True
    return False

