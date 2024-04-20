import mysql.connector
from time import sleep

def connect_to_db():
    while True:
        try:
            connection = mysql.connector.connect(host="localhost",
                                                user="root",
                                                password="",
                                                database="cpw_sql")
            return connection
        except Exception as e:
            print("Error: " + str(e))
            print("Will reconnect to db in 3 sec.")
            sleep(3)

##use
def get_answer(message_group,main_question_type = None):
    try:
        print("Get in get_answer <<")
        connection = connect_to_db()
        db_cursor = connection.cursor()

        # คำสั่ง SQL สำหรับเพิ่มข้อมูล
        if message_group != "question":
            sql_command = "SELECT answer FROM `answer_question` WHERE message_group = %s"
            # ทำการ execute คำสั่ง SQL
            db_cursor.execute(sql_command, (message_group,))
            res = db_cursor.fetchone()
            print(f"get_answer result ::{res[0]}")
            return res[0]
        else:
            sql_command = "SELECT answer_question_id,answer FROM `answer_question` WHERE message_group = %s AND question_type = %s"
            # ทำการ execute คำสั่ง SQL
            db_cursor.execute(sql_command, (message_group, main_question_type,))
            res = db_cursor.fetchone()
            print(f"get_answer result ::{res}")
            return res

    except Exception as e:
        print(f"Error: {e}")

def get_choice_range(answerQuestionId):
    print("Get in get_choice_range <<")
    connection = connect_to_db()
    db_cursor = connection.cursor()
    sql_count_choice = "SELECT count(choice) FROM sub_answer WHERE answer_question_id = %s"
    db_cursor.execute(sql_count_choice, (answerQuestionId,))
    count_choice = db_cursor.fetchone()
    print(int(count_choice[0]))
    return int(count_choice[0])

##use
def get_sub_answer_err(choice:str):
    try:
        print("Get in get_sub_answer 1 <<")
        connection = connect_to_db()
        db_cursor = connection.cursor()
        sql_command = "SELECT s_answer FROM sub_answer "
        sql_command+= "WHERE choice = %s "
        db_cursor.execute(sql_command, (choice,))
        # ทำการ execute คำสั่ง SQL
        res = db_cursor.fetchone()
        print(f"get_sub_answer ::{res}")
        return res

    except Exception as e:       
        print(f"Error: {e}")

##use
def get_sub_answer(choice:str,answerQuestionId:str):
    try:
        print("Get in get_sub_answer 2<<")
        connection = connect_to_db()
        db_cursor = connection.cursor()

        sql_command = "SELECT sub.s_answer,sub.agency_id,agen.agency_name FROM sub_answer as sub "
        sql_command+= "INNER JOIN cpw_agency as agen ON sub.agency_id = agen.agency_id "
        sql_command+= "WHERE sub.choice = %s AND sub.answer_question_id = %s "
        db_cursor.execute(sql_command, (choice, answerQuestionId))
        
        # ทำการ execute คำสั่ง SQL
        res = db_cursor.fetchone()
        print(f"get_sub_answer ::{res}")
        return res

    except Exception as e:       
        print(f"Error: {e}")


##use
def get_bad_word_handler():
    try:
        print("Get in get_answer <<")
        connection = connect_to_db()
        db_cursor = connection.cursor()

        # คำสั่ง SQL สำหรับเพิ่มข้อมูล
        sql_command = "SELECT answer FROM `answer_question` WHERE message_group = 'bad_word_handler'"
        # ทำการ execute คำสั่ง SQL
        db_cursor.execute(sql_command)
        res = db_cursor.fetchone()
        print(f"get_bad_word_handler result ::{res[0]}")
        return res[0]

    except Exception as e:
        print(f"Error: {e}")    
