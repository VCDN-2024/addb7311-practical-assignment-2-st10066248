 --Question 1
 CREATE TABLE CUSTOMER (
    CUSTOMER_ID NUMBER(5) PRIMARY KEY,
    FIRST_NAME VARCHAR2(50),
    SURNAME VARCHAR2(50),
    ADDRESS VARCHAR2(100),
    CONTACT_NUMBER VARCHAR2(15),
    EMAIL VARCHAR2(100)
    );
    
    CREATE TABLE EMPLOYEE (
    EMPLOYEE_ID VARCHAR2(10) PRIMARY KEY,
    FIRST_NAME VARCHAR2(50),
    SURNAME VARCHAR2(50),
    CONTACT_NUMBER VARCHAR2(15),
    ADDRESS VARCHAR2(100),
    EMAIL VARCHAR2(100)
);

CREATE TABLE DONATOR (
    DONATOR_ID NUMBER(5) PRIMARY KEY,
    FIRST_NAME VARCHAR2(50),
    SURNAME VARCHAR2(50),
    CONTACT_NUMBER VARCHAR2(15),
    EMAIL VARCHAR2(100)
);

CREATE TABLE DONATION (
    DONATION_ID NUMBER(5) PRIMARY KEY,
    DONATOR_ID NUMBER(5),
    DONATION VARCHAR2(100),
    PRICE NUMBER(10, 2),
    DONATION_DATE DATE,
    FOREIGN KEY (DONATOR_ID) REFERENCES DONATOR(DONATOR_ID)
);

CREATE TABLE DELIVERY (
    DELIVERY_ID NUMBER(5) PRIMARY KEY,
    DELIVERY_NOTES VARCHAR2(100),
    DISPATCH_DATE DATE,
    DELIVERY_DATE DATE
);

CREATE TABLE RETURNS (
    RETURN_ID VARCHAR2(10) PRIMARY KEY,
    RETURN_DATE DATE,
    REASON VARCHAR2(255),
    CUSTOMER_ID NUMBER(5),
    DONATION_ID NUMBER(5),
    EMPLOYEE_ID VARCHAR2(10),
    FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER(CUSTOMER_ID),
    FOREIGN KEY (DONATION_ID) REFERENCES DONATION(DONATION_ID),
    FOREIGN KEY (EMPLOYEE_ID) REFERENCES EMPLOYEE(EMPLOYEE_ID)
);

CREATE TABLE INVOICE (
    INVOICE_NUM NUMBER(5) PRIMARY KEY,
    CUSTOMER_ID NUMBER(5),
    INVOICE_DATE DATE,
    EMPLOYEE_ID VARCHAR2(10),
    DONATION_ID NUMBER(5),
    DELIVERY_ID NUMBER(5),
    FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER(CUSTOMER_ID),
    FOREIGN KEY (EMPLOYEE_ID) REFERENCES EMPLOYEE(EMPLOYEE_ID),
    FOREIGN KEY (DONATION_ID) REFERENCES DONATION(DONATION_ID),
    FOREIGN KEY (DELIVERY_ID) REFERENCES DELIVERY(DELIVERY_ID)
);

-- Insert data into CUSTOMER Table
INSERT INTO CUSTOMER VALUES (11011, 'Jack', 'Smith', '18 Water Rd', '0877277521', 'jsmith@isat.com');
INSERT INTO CUSTOMER VALUES (11012, 'Pat', 'Hendricks', '22 Water Rd', '0863257857', 'ph@mcom.co.za');
INSERT INTO CUSTOMER VALUES (11013, 'Andre', 'Clark', '101 Summer Lane', '0834567891', 'aclark@mcom.co.za');
INSERT INTO CUSTOMER VALUES (11014, 'Kevin', 'Jones', '55 Mountain way', '0612547895', 'kj@isat.co.za');
INSERT INTO CUSTOMER VALUES (11015, 'Lucy', 'Williams', '5 Main rd', '0827238521', 'lw@mcal.co.za');

-- Insert data into EMPLOYEE Table
INSERT INTO EMPLOYEE VALUES ('emp101', 'Jeff', 'Davis', '0877277521', '10 main road', 'jand@isat.com');
INSERT INTO EMPLOYEE VALUES ('emp102', 'Kevin', 'Marks', '0837377522', '18 water road', 'km@isat.com');
INSERT INTO EMPLOYEE VALUES ('emp103', 'Adanya', 'Andrews', '0817117523', '21 circle lane', 'aa@isat.com');
INSERT INTO EMPLOYEE VALUES ('emp104', 'Adebayo', 'Dryer', '0797215244', '1 sea road', 'aryer@isat.com');
INSERT INTO EMPLOYEE VALUES ('emp105', 'Xolani', 'Samson', '0827122255', '12 main road', 'xosam@isat.com');

-- Insert data into DONATOR Table
INSERT INTO DONATOR VALUES (20111, 'Jeff', 'Watson', '0827172250', 'jwatson@ymail.com');
INSERT INTO DONATOR VALUES (20112, 'Stephen', 'Jones', '0837865670', 'joness@ymail.com');
INSERT INTO DONATOR VALUES (20113, 'James', 'Joe', '0878978650', 'jj@isat.com');
INSERT INTO DONATOR VALUES (20114, 'Kelly', 'Ross', '0826575650', 'kross@gsat.com');
INSERT INTO DONATOR VALUES (20115, 'Abraham', 'Clark', '0797656430', 'aclark@ymail.com');

-- Insert data into DONATION Table
INSERT INTO DONATION VALUES (7111, 20111, 'KIC Fridge', 599, TO_DATE('01-MAY-2024', 'DD-MON-YYYY'));
INSERT INTO DONATION VALUES (7112, 20112, 'Samsung 42inch LCD', 1299, TO_DATE('03-MAY-2024', 'DD-MON-YYYY'));
INSERT INTO DONATION VALUES (7113, 20113, 'Sharp Microwave', 1599, TO_DATE('03-MAY-2024', 'DD-MON-YYYY'));
INSERT INTO DONATION VALUES (7114, 20115, '6 Seat Dining room table', 799, TO_DATE('05-MAY-2024', 'DD-MON-YYYY'));
INSERT INTO DONATION VALUES (7115, 20114, 'Lazyboy Sofa', 1199, TO_DATE('07-MAY-2024', 'DD-MON-YYYY'));
INSERT INTO DONATION VALUES (7116, 20113, 'JVC Surround Sound System', 179, TO_DATE('09-MAY-2024', 'DD-MON-YYYY'));

-- Insert data into DELIVERY Table
INSERT INTO DELIVERY VALUES (511, 'Double packaging requested', TO_DATE('10-MAY-2024', 'DD-MON-YYYY'), TO_DATE('15-MAY-2024', 'DD-MON-YYYY'));
INSERT INTO DELIVERY VALUES (512, 'Delivery to work address', TO_DATE('12-MAY-2024', 'DD-MON-YYYY'), TO_DATE('15-MAY-2024', 'DD-MON-YYYY'));
INSERT INTO DELIVERY VALUES (513, 'Signature required', TO_DATE('12-MAY-2024', 'DD-MON-YYYY'), TO_DATE('17-MAY-2024', 'DD-MON-YYYY'));
INSERT INTO DELIVERY VALUES (514, 'No notes', TO_DATE('12-MAY-2024', 'DD-MON-YYYY'), TO_DATE('15-MAY-2024', 'DD-MON-YYYY'));
INSERT INTO DELIVERY VALUES (515, 'Birthday present wrapping required', TO_DATE('18-MAY-2024', 'DD-MON-YYYY'), TO_DATE('19-MAY-2024', 'DD-MON-YYYY'));
INSERT INTO DELIVERY VALUES (516, 'Delivery to work address', TO_DATE('20-MAY-2024', 'DD-MON-YYYY'), TO_DATE('25-MAY-2024', 'DD-MON-YYYY'));

-- Insert data into RETURNS Table
INSERT INTO RETURNS VALUES ('ret001', TO_DATE('25-MAY-2024', 'DD-MON-YYYY'), 'Customer not satisfied with product', 11011, 7116, 'emp101');
INSERT INTO RETURNS VALUES ('ret002', TO_DATE('25-MAY-2024', 'DD-MON-YYYY'), 'Product had broken section', 11013, 7114, 'emp103');

-- Insert data into INVOICE Table
INSERT INTO INVOICE VALUES (8111, 11011, TO_DATE('15-MAY-2024', 'DD-MON-YYYY'), 'emp103', 7111, 511);
INSERT INTO INVOICE VALUES (8112, 11013, TO_DATE('15-MAY-2024', 'DD-MON-YYYY'), 'emp101', 7114, 512);
INSERT INTO INVOICE VALUES (8113, 11012, TO_DATE('17-MAY-2024', 'DD-MON-YYYY'), 'emp101', 7112, 513);
INSERT INTO INVOICE VALUES (8114, 11015, TO_DATE('17-MAY-2024', 'DD-MON-YYYY'), 'emp102', 7113, 514);
INSERT INTO INVOICE VALUES (8115, 11011, TO_DATE('17-MAY-2024', 'DD-MON-YYYY'), 'emp102', 7115, 515);
INSERT INTO INVOICE VALUES (8116, 11015, TO_DATE('18-MAY-2024', 'DD-MON-YYYY'), 'emp103', 7116, 516);


SELECT 
    CONCAT(C.FIRST_NAME, ', ', C.SURNAME) AS CUSTOMER,
    I.EMPLOYEE_ID,
    D.DELIVERY_NOTES,
    N.DONATION,
    I.INVOICE_NUM,
    I.INVOICE_DATE
FROM 
    CUSTOMER C
    JOIN INVOICE I ON C.CUSTOMER_ID = I.CUSTOMER_ID
    JOIN DELIVERY D ON I.DELIVERY_ID = D.DELIVERY_ID
    JOIN DONATION N ON I.DONATION_ID = N.DONATION_ID
WHERE 
    I.INVOICE_DATE > TO_DATE('16-MAY-2024', 'DD-MON-YYYY');
    
    SELECT 
    CONTACT(C.FIRST_NAME, ', ', C.SURNAME) AS CUSTOMER,
    I.EMPLOYEE_ID,
    D.DELIVERY_NOTES,
    N.DONATION,
    I.INVOICE_NUM,
    I.INVOICE_DATE
FROM 
    CUSTOMER C
    JOIN INVOICE I ON C.CUSTOMER_ID = I.CUSTOMER_ID
    JOIN DELIVERY D ON I.DELIVERY_ID = D.DELIVERY_ID
    JOIN DONATION N ON I.DONATION_ID = N.DONATION_ID
WHERE 
    I.INVOICE_DATE > TO_DATE('16-MAY-2024', 'DD-MON-YYYY');


-- Question 3
CREATE TABLE FUNDING (
    FUNDING_ID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    FUNDER VARCHAR(100),
    FUNDING_AMOUNT DECIMAL(10, 2)
);

-- Insert sample data
INSERT INTO FUNDING (FUNDER, FUNDING_AMOUNT) VALUES ('National Trust', 5000);
INSERT INTO FUNDING (FUNDER, FUNDING_AMOUNT) VALUES ('Charity Organization A', 1200);

-- Question 4

SET SERVEROUTPUT ON;

DECLARE
    CURSOR return_cursor IS
        SELECT 
            c.FIRST_NAME || ', ' || c.SURNAME AS CUSTOMER_NAME,
            don.DONATION AS DONATION_PURCHASED,
            don.PRICE,
            r.REASON AS RETURN_REASON
        FROM 
            RETURNS r
        JOIN 
            CUSTOMER c ON r.CUSTOMER_ID = c.CUSTOMER_ID
        JOIN 
            DONATION don ON r.DONATION_ID = don.DONATION_ID;

    v_customer_name VARCHAR2(100);
    v_donation_purchased VARCHAR2(100);
    v_price NUMBER(10, 2);
    v_return_reason VARCHAR2(255);

BEGIN
    FOR rec IN return_cursor LOOP
        v_customer_name := rec.CUSTOMER_NAME;
        v_donation_purchased := rec.DONATION_PURCHASED;
        v_price := rec.PRICE;
        v_return_reason := rec.RETURN_REASON;

        DBMS_OUTPUT.PUT_LINE('CUSTOMER: ' || v_customer_name);
        DBMS_OUTPUT.PUT_LINE('DONATION PURCHASED: ' || v_donation_purchased);
        DBMS_OUTPUT.PUT_LINE('PRICE: ' || v_price);
        DBMS_OUTPUT.PUT_LINE('RETURN REASON: ' || v_return_reason);
        DBMS_OUTPUT.PUT_LINE('--------------------------');
    END LOOP;

END;
/


-- Question 5
SET SERVEROUTPUT ON;

DECLARE
    CURSOR delivery_cursor IS
        SELECT 
            c.FIRST_NAME || ' ' || c.SURNAME AS CUSTOMER_NAME,
            e.FIRST_NAME || ' ' || e.SURNAME AS EMPLOYEE_NAME,
            don.DONATION AS DONATION,
            d.DISPATCH_DATE,
            d.DELIVERY_DATE,
            d.DELIVERY_DATE - d.DISPATCH_DATE AS DAYS_TO_DELIVERY
        FROM 
            INVOICE i
        JOIN 
            CUSTOMER c ON i.CUSTOMER_ID = c.CUSTOMER_ID
        JOIN 
            EMPLOYEE e ON i.EMPLOYEE_ID = e.EMPLOYEE_ID
        JOIN 
            DONATION don ON i.DONATION_ID = don.DONATION_ID
        JOIN 
            DELIVERY d ON i.DELIVERY_ID = d.DELIVERY_ID
        WHERE 
            c.CUSTOMER_ID = 11011;  -- Filter for customer ID 11011

    v_customer_name VARCHAR2(100);
    v_employee_name VARCHAR2(100);
    v_donation VARCHAR2(100);
    v_dispatch_date DATE;
    v_delivery_date DATE;
    v_days_to_delivery NUMBER;

BEGIN
    FOR rec IN delivery_cursor LOOP
        v_customer_name := rec.CUSTOMER_NAME;
        v_employee_name := rec.EMPLOYEE_NAME;
        v_donation := rec.DONATION;
        v_dispatch_date := rec.DISPATCH_DATE;
        v_delivery_date := rec.DELIVERY_DATE;
        v_days_to_delivery := rec.DAYS_TO_DELIVERY;

        DBMS_OUTPUT.PUT_LINE('CUSTOMER: ' || v_customer_name);
        DBMS_OUTPUT.PUT_LINE('EMPLOYEE: ' || v_employee_name);
        DBMS_OUTPUT.PUT_LINE('DONATION: ' || v_donation);
        DBMS_OUTPUT.PUT_LINE('DISPATCH DATE: ' || TO_CHAR(v_dispatch_date, 'DD/MON/YY'));
        DBMS_OUTPUT.PUT_LINE('DELIVERY DATE: ' || TO_CHAR(v_delivery_date, 'DD/MON/YY'));
        DBMS_OUTPUT.PUT_LINE('DAYS TO DELIVERY: ' || v_days_to_delivery);
        DBMS_OUTPUT.PUT_LINE('--------------------------');
    END LOOP;

END;
/


-- QUESTION 6
SET SERVEROUTPUT ON;

DECLARE
    CURSOR customer_spending IS
        SELECT 
            c.FIRST_NAME || ' ' || c.SURNAME AS CUSTOMER_NAME,
            SUM(don.PRICE) AS TOTAL_SPENT,
            CASE 
                WHEN SUM(don.PRICE) >= 1500 THEN '***'  -- 3-star rating
                WHEN SUM(don.PRICE) >= 1000 THEN '**'   -- 2-star rating
                ELSE '*'                                 -- 1-star rating
            END AS CUSTOMER_RATING
        FROM 
            INVOICE i
        JOIN 
            CUSTOMER c ON i.CUSTOMER_ID = c.CUSTOMER_ID
        JOIN 
            DONATION don ON i.DONATION_ID = don.DONATION_ID
        GROUP BY 
            c.FIRST_NAME, c.SURNAME;

    v_customer_name VARCHAR2(100);
    v_total_spent NUMBER(10, 2);
    v_customer_rating VARCHAR2(10);

BEGIN
    FOR rec IN customer_spending LOOP
        v_customer_name := rec.CUSTOMER_NAME;
        v_total_spent := rec.TOTAL_SPENT;
        v_customer_rating := rec.CUSTOMER_RATING;

        DBMS_OUTPUT.PUT_LINE('FIRST NAME: ' || v_customer_name);
        DBMS_OUTPUT.PUT_LINE('AMOUNT: R ' || v_total_spent);
        DBMS_OUTPUT.PUT_LINE('CUSTOMER RATING: ' || v_customer_rating);
        DBMS_OUTPUT.PUT_LINE('--------------------------');
    END LOOP;

END;
/
--Question 7.1
          DECLARE
    v_customer_name CUSTOMER.FIRST_NAME%TYPE;
BEGIN
    SELECT FIRST_NAME INTO v_customer_name FROM CUSTOMER WHERE CUSTOMER_ID = 11011;
    DBMS_OUTPUT.PUT_LINE('Customer Name: ' || v_customer_name);
END;
    
    --Question 7.2
DECLARE
    v_customer CUSTOMER%ROWTYPE;
BEGIN
    SELECT * INTO v_customer FROM CUSTOMER WHERE CUSTOMER_ID = 11011;
    DBMS_OUTPUT.PUT_LINE('Customer Name: ' || v_customer.FIRST_NAME || ' ' || v_customer.SURNAME);
END;
      
-- Question 7.3                                                                                            
DECLARE
    insufficient_funds EXCEPTION;
    v_funding_amount NUMBER := 400;
BEGIN
    IF v_funding_amount < 500 THEN
        RAISE insufficient_funds;
    END IF;
EXCEPTION
    WHEN insufficient_funds THEN
        DBMS_OUTPUT.PUT_LINE('Error: Funding amount is too low.');
END;

--Question 8
SELECT 
    c.FIRST_NAME || ' ' || c.SURNAME AS CUSTOMER_NAME,
    SUM(don.PRICE) AS TOTAL_SPENT,
    CASE 
        WHEN SUM(don.PRICE) >= 1500 THEN '***'  -- 3-star rating
        WHEN SUM(don.PRICE) >= 1000 THEN '**'   -- 2-star rating
        ELSE '*'                                 -- 1-star rating
    END AS CUSTOMER_RATING
FROM 
    INVOICE i
JOIN 
    CUSTOMER c ON i.CUSTOMER_ID = c.CUSTOMER_ID
JOIN 
    DONATION don ON i.DONATION_ID = don.DONATION_ID
GROUP BY 
    c.FIRST_NAME, c.SURNAME;

