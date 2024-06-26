
from package.sql_connector import *
from package.nlp_function import *
from package.bow_bad_word import find_bad_word_in_string

from flask import Flask,request
import joblib
import numpy as np
import re
import string
from pythainlp.util import normalize



def remove_emoji(string):
    emoji_pattern = re.compile("["
                               u"\U0001F600-\U0001F64F"  # emoticons
                               u"\U0001F300-\U0001F5FF"  # symbols & pictographs
                               u"\U0001F680-\U0001F6FF"  # transport & map symbols
                               u"\U0001F1E0-\U0001F1FF"  # flags (iOS)
                               u"\U00002500-\U00002BEF"  # chinese char
                               u"\U00002702-\U000027B0"
                               u"\U00002702-\U000027B0"
                               u"\U000024C2-\U0001F251"
                               u"\U0001f926-\U0001f937"
                               u"\U00010000-\U0010ffff"
                               u"\u2640-\u2642"
                               u"\u2600-\u2B55"
                               u"\u200d"
                               u"\u23cf"
                               u"\u23e9"
                               u"\u231a"
                               u"\ufe0f"  # dingbats
                               u"\u3030"
                               "]+", flags=re.UNICODE)
    return emoji_pattern.sub(r'', string)

def clean_msg(msg):
    # ลบ text ที่อยู่ในวงเล็บ <> ทั้งหมด
    msg = re.sub(r'<.*?>', '', msg)
    # ลบ hashtag
    msg = re.sub(r'#', '', msg)
    # ลบ เครื่องหมายคำพูด (punctuation)
    for c in string.punctuation:
        msg = re.sub(r'\{}'.format(c), '', msg)
    # ทำให้ทุกคำต่อกัน
    msg = ' '.join(msg.split())
    # ลบ link https
    msg = re.sub(r'http\S+', '', msg)

    return msg


def cleanning(text):
    return clean_msg(normalize(remove_emoji(text)))

app = Flask(__name__)

@app.route("/getSegment", methods=['POST'])
def Segment():
    request_data = request.get_json()
    replyFromUser = request_data["reply"]

    if(find_bad_word_in_string(replyFromUser)):
        feedback = get_bad_word_handler()
        data={ 
                "cutword": None,
                "segmentType": "2",
                "feedback" : feedback,
                "description": "bad_word_handler"
            } 
        print("Data ::::")
        print(data)
        return data 

    split_text_ai=text_process_save_comma(str(split_word(cleanning(replyFromUser)))) 

    readable_text_list = vectorizer_readable.transform([split_text_ai]).reshape(1,-1).todense()
    readable_predictions = readable_model.predict(np.asarray(readable_text_list)) 


    if(readable_predictions[0]==1):

            segment_text_list = vectorizer_segment.transform([split_text_ai]).reshape(1,-1).todense()  # นำข้อความที่ถูกแบ่งคำแล้ว (split_text_ai) มาใช้ vectorizer (vectorizer_question) ในการแปลงเป็น vector โดยใช้ transform และ reshape เพื่อเตรียมข้อมูลและแปลงเป็น dense matrix ด้วย todense().
            segment_predictions = segment_model.predict(np.asarray(segment_text_list)) 
            description =""
            feedback = ""
            if(segment_predictions[0]==0): 
                description = "negative"
                feedback = get_answer(description)
            elif (segment_predictions[0]==1):
                description = "positive"
                feedback = get_answer(description)
            else:
                description = "question"
            print("Description ::::"+description)
            data={ 
                    "cutword": split_text_ai,
                    "segmentType": str(segment_predictions[0]),
                    "feedback" : feedback,
                    "description": description
                } 
            print("\n+++++++++Valid Th(Segment)+++++++++++++")
            print("Data ::::")
            print(data)
            print("+++++++++++++++++++++++++\n")
    else:
        data={ 
                "cutword": None,
                "segmentType": "2",
                "feedback" : "2",
                "description": "Invalid Thai word"
            } 
        print("\n+++++++++Inalid Th or Unreadable(Segment)++++++++++++")
        print("Data ::::")
        print(data)
        print("+++++++++++++++++++++++++\n")
    return data 

@app.route("/getMainQuestionType", methods=['POST'])
def mainQuesType():
    
    request_data = request.get_json()
    replyFromUser = request_data["reply"]

    #if bad_word found will return bad word handle and exit this api
    if(find_bad_word_in_string(replyFromUser)):
        feedback = get_bad_word_handler()
        data={ 
                "cutword": None,
                "segmentType": "2",
                "feedback" : feedback,
                "description": "bad_word_handler"
            } 
        print("Data ::::")
        print(data)
        return data 

    split_text_ai=text_process_save_comma(str(split_word(cleanning(replyFromUser)))) 
    readable_text_list = vectorizer_readable.transform([split_text_ai]).reshape(1,-1).todense()
    readable_predictions = readable_model.predict(np.asarray(readable_text_list)) 

    if(readable_predictions[0]==1):
        text_list = vectorizer_question.transform([split_text_ai]).reshape(1,-1).todense() 
        predictions = question_model.predict(np.asarray(text_list))   
        feedback = get_answer("question",str(predictions[0]))
        description =""
        if(predictions[0]==1): 
            description = "วิชาการ"
        elif (predictions[0]==2):
            description = "โภชนาการ"
        elif (predictions[0]==3):
            description = "ปกครอง"
        elif (predictions[0]==4):
            description = "ธุรการ"
        elif (predictions[0]==5):
            description = "สารสนเทศ" 
        else:
            description = "รอสักครู่ ฉันจะรีบติดต่อกลับไปให้เร็วที่สุดนะคะ / I’ll get back to you as soon as possible"          
        print("DescriptionMainQuestion ::::"+description)
        data={ 
                "cutword": split_text_ai,
                "mainQuesType": str(predictions[0]),
                "answerQuestionId":feedback[0],
                "feedback":feedback[1],
                "description": description
            } 
        print("\n+++++++++Valid Th(Question)++++++++++++")
        print("Data ::::")
        print(data )
        print("+++++++++++++++++++++++++\n")
        return data 
    else:
        feedback = get_answer("question","0")
        data={ 
                "cutword": None,
                "mainQuesType": "0",
                "answerQuestionId":None,
                "feedback":feedback[1],
                "description": feedback
            } 
        print("\n+++++++++++Invalid Th or Unreadable(Question)++++++++++++")
        print("Data ::::")
        print(data)
        print("+++++++++++++++++++++++++\n")
        return data 
    

@app.route("/getSubQuestionType", methods=['POST'])
def subQuesType():
    request_data = request.get_json()

    choice = request_data["choice"]
    answerQuestionId = request_data["answerQuestionId"]
    get_range = get_choice_range(answerQuestionId)
    int_choice = int(choice)
    if(int_choice<1 or int_choice>get_range):
        print("set 00")
        result = get_sub_answer_err("00")
    else:
        print("set by json")
        result = get_sub_answer(choice,answerQuestionId)

    feedback = result[0]
    # feedback = "รอสักครู่ ฉันจะรีบติดต่อกลับไปให้เร็วที่สุดนะคะ / I’ll get back to you as soon as possible "

    try:
        agencyId=result[1]
        description=result[2]
    except:
        agencyId=''
        description=''

    agency = {"agencyId":agencyId,"description":description}

    data={ 
                "userChoice": choice,
                "mainQuesId":answerQuestionId,
                "agency":agency,
                "feedback":feedback
        } 
    # try:
    #     result = get_sub_answer(choice,answerQuestionId)

    #     feedback = result[0]
    #     agencyId = result[1]
    #     description = result[2]

    #     agency = {"agencyId":agencyId,"description":description}

    #     data={ 
    #             "userChoice": choice,
    #             "mainQuesId":answerQuestionId,
    #             "agency":agency,
    #             "feedback":feedback
    #         } 
    # except:
    #     result = get_sub_answer("00","other")
    #     feedback = result[0]
    #     agency = {"agencyId":None,"description":None}
    #     data={ 
    #             "userChoice": choice,
    #             "mainQuesId":answerQuestionId,
    #             "agency":agency,
    #             "feedback":feedback
    #         }
    print(data)
    return data 

if __name__ =="__main__":

    # LOAD SEGMENT MODEL
    # 0:Negative 1:Positive 2:Question
    segment_type = "segment_classify/check_segment_type.sav"
    segment_vectorizer = "segment_classify/segment_vectorizer_word.sav"
    segment_model = joblib.load(open(segment_type,"rb"))
    vectorizer_segment = joblib.load(open(segment_vectorizer,"rb"))

    # LOAD QEUSTION MODEL
    # 0: 1: 2: 3: 4: 5:
    question_type = "question_classify/check_question_type.sav"
    question_vectorizer = "question_classify/question_vectorizer_word.sav"
    question_model = joblib.load(open(question_type,"rb"))
    vectorizer_question = joblib.load(open(question_vectorizer,"rb"))

    # LOAD READABLE MODEL
    # 0:unreadable 1:readable
    readable = "readble_classify/check_read_or_not.sav"
    readable_vectorizer = "readble_classify/segment_read_or_not.sav"
    readable_model = joblib.load(open(readable,"rb"))
    vectorizer_readable = joblib.load(open(readable_vectorizer,"rb"))

    app.run(debug=True)
