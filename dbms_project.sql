select sysdate from dual;


CREATE TABLE Users (
    user_id     NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name   VARCHAR2(100) NOT NULL,
    email       VARCHAR2(100) UNIQUE NOT NULL,
    phone       VARCHAR2(15),
    role        VARCHAR2(20) CHECK (role IN ('admin', 'volunteer', 'victim')),
    created_at  DATE DEFAULT SYSDATE
);




CREATE TABLE Disaster (
    disaster_id   NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    disaster_name VARCHAR2(100) NOT NULL,
    disaster_type VARCHAR2(50) CHECK (disaster_type IN ('flood', 'earthquake', 'cyclone', 'fire', 'other')),
    location      VARCHAR2(100),
    start_date    DATE,
    status        VARCHAR2(20) DEFAULT 'active' CHECK (status IN ('active', 'resolved'))
);


CREATE TABLE Relief_Center (
    center_id     NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    center_name   VARCHAR2(100) NOT NULL,
    location      VARCHAR2(100),
    capacity      NUMBER
);



CREATE TABLE Resources (
    resource_id   NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    resource_name VARCHAR2(100) NOT NULL,
    category      VARCHAR2(50) CHECK (category IN ('food', 'medicine', 'shelter', 'clothing', 'other')),
    unit          VARCHAR2(20)
);

CREATE TABLE Resource_Stock (
    stock_id      NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    resource_id   NUMBER REFERENCES Resources(resource_id),
    center_id     NUMBER REFERENCES Relief_Center(center_id),
    quantity      NUMBER DEFAULT 0,
    last_updated  DATE DEFAULT SYSDATE
);

CREATE TABLE Volunteer (
    volunteer_id  NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    user_id       NUMBER REFERENCES Users(user_id),
    skill         VARCHAR2(100),
    availability  VARCHAR2(20) CHECK (availability IN ('available', 'deployed', 'inactive'))
);


CREATE TABLE Volunteer_Assignment (
    assignment_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    volunteer_id  NUMBER REFERENCES Volunteer(volunteer_id),
    center_id     NUMBER REFERENCES Relief_Center(center_id),
    assigned_date DATE DEFAULT SYSDATE,
    status        VARCHAR2(20) CHECK (status IN ('active', 'completed'))
);

CREATE TABLE Request (
    request_id    NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    user_id       NUMBER REFERENCES Users(user_id),
    disaster_id   NUMBER REFERENCES Disaster(disaster_id),
    resource_id   NUMBER REFERENCES Resources(resource_id),
    quantity      NUMBER,
    request_date  DATE DEFAULT SYSDATE,
    status        VARCHAR2(20) DEFAULT 'pending' CHECK (status IN ('pending', 'approved', 'rejected'))
);

CREATE TABLE Resource_Allocation (
    allocation_id  NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    request_id     NUMBER REFERENCES Request(request_id),
    center_id      NUMBER REFERENCES Relief_Center(center_id),
    quantity       NUMBER,
    allocated_date DATE DEFAULT SYSDATE
);

INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Aarav Sharma', 'aarav.s@gmail.com', '9876500001', 'volunteer', TO_DATE('2023-05-14', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Priya Gupta', 'priya.g@yahoo.com', '9876500002', 'victim', TO_DATE('2024-08-21', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Rahul Verma', 'rahul.v@gmail.com', '9876500003', 'admin', TO_DATE('2023-01-10', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Neha Singh', 'neha.s@hotmail.com', '9876500004', 'volunteer', TO_DATE('2025-02-15', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Kavya Singla', 'kavya.s@gmail.com', '9876500005', 'admin', TO_DATE('2023-11-05', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Amit Kumar', 'amit.k@yahoo.com', '9876500006', 'victim', TO_DATE('2024-04-12', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Riya Patel', 'riya.p@gmail.com', '9876500007', 'volunteer', TO_DATE('2023-09-18', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Karan Malhotra', 'karan.m@hotmail.com', '9876500008', 'victim', TO_DATE('2026-01-20', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Khushi Gupta', 'khushi.g@gmail.com', '9876500009', 'admin', TO_DATE('2023-03-30', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Sneha Joshi', 'sneha.j@yahoo.com', '9876500010', 'volunteer', TO_DATE('2024-11-11', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Avreet Kaur', 'avreet.k@gmail.com', '9876500011', 'admin', TO_DATE('2023-07-25', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Vikram Singh', 'vikram.s@yahoo.com', '9876500012', 'victim', TO_DATE('2024-12-05', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Pooja Sharma', 'pooja.s@gmail.com', '9876500013', 'volunteer', TO_DATE('2025-06-15', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Rohan Das', 'rohan.d@hotmail.com', '9876500014', 'victim', TO_DATE('2026-03-01', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Anjali Tiwari', 'anjali.t@gmail.com', '9876500015', 'volunteer', TO_DATE('2024-02-28', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Deepak Yadav', 'deepak.y@yahoo.com', '9876500016', 'victim', TO_DATE('2023-10-10', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Simran Kaur', 'simran.k@gmail.com', '9876500017', 'volunteer', TO_DATE('2025-01-12', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Aditya Nath', 'aditya.n@hotmail.com', '9876500018', 'victim', TO_DATE('2024-07-07', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Kirti Reddy', 'kirti.r@gmail.com', '9876500019', 'admin', TO_DATE('2023-04-04', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Manish Goyal', 'manish.g@yahoo.com', '9876500020', 'volunteer', TO_DATE('2024-09-09', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Sanya Arora', 'sanya.a@gmail.com', '9876500021', 'victim', TO_DATE('2026-12-12', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Gaurav Bhatia', 'gaurav.b@hotmail.com', '9876500022', 'volunteer', TO_DATE('2025-02-20', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Nidhi Agarwal', 'nidhi.a@gmail.com', '9876500023', 'victim', TO_DATE('2024-05-18', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Tarun Mehta', 'tarun.m@yahoo.com', '9876500024', 'volunteer', TO_DATE('2023-08-22', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Megha Chawla', 'megha.c@gmail.com', '9876500025', 'victim', TO_DATE('2025-03-10', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Rajat Kapoor', 'rajat.k@hotmail.com', '9876500026', 'volunteer', TO_DATE('2024-10-15', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Divya Jain', 'divya.j@gmail.com', '9876500027', 'victim', TO_DATE('2023-02-14', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Saurabh Mishra', 'saurabh.m@yahoo.com', '9876500028', 'volunteer', TO_DATE('2026-01-05', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Tanya Bansal', 'tanya.b@gmail.com', '9876500029', 'victim', TO_DATE('2024-06-25', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Pranav Desai', 'pranav.d@hotmail.com', '9876500030', 'volunteer', TO_DATE('2023-11-30', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Ishita Sen', 'ishita.s@gmail.com', '9876500031', 'victim', TO_DATE('2024-01-08', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Harsh Vardhan', 'harsh.v@yahoo.com', '9876500032', 'volunteer', TO_DATE('2025-02-28', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Radhika Nair', 'radhika.n@gmail.com', '9876500033', 'victim', TO_DATE('2023-05-19', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Arjun Pillai', 'arjun.p@hotmail.com', '9876500034', 'volunteer', TO_DATE('2024-12-12', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Shikha Pandey', 'shikha.p@gmail.com', '9876500035', 'victim', TO_DATE('2026-09-05', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Yash Rana', 'yash.r@yahoo.com', '9876500036', 'volunteer', TO_DATE('2025-03-15', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Aarti Saxena', 'aarti.s@gmail.com', '9876500037', 'victim', TO_DATE('2024-03-22', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Naman Jain', 'naman.j@hotmail.com', '9876500038', 'volunteer', TO_DATE('2023-07-11', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Pallavi Das', 'pallavi.d@gmail.com', '9876500039', 'victim', TO_DATE('2025-01-25', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Rishi Kumar', 'rishi.k@yahoo.com', '9876500040', 'volunteer', TO_DATE('2024-08-30', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Kritika Ahuja', 'kritika.a@gmail.com', '9876500041', 'victim', TO_DATE('2023-10-20', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Varun Dhawan', 'varun.d@hotmail.com', '9876500042', 'volunteer', TO_DATE('2025-02-14', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Swati Bose', 'swati.b@gmail.com', '9876500043', 'victim', TO_DATE('2026-11-01', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Akhil Iyer', 'akhil.i@yahoo.com', '9876500044', 'volunteer', TO_DATE('2023-01-25', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Rashmi Thakur', 'rashmi.t@gmail.com', '9876500045', 'victim', TO_DATE('2025-03-20', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Mohit Chauhan', 'mohit.c@hotmail.com', '9876500046', 'volunteer', TO_DATE('2024-04-18', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Ananya Mittal', 'ananya.m@gmail.com', '9876500047', 'victim', TO_DATE('2023-06-28', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Sahil Khurana', 'sahil.k@yahoo.com', '9876500048', 'volunteer', TO_DATE('2025-01-30', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Bhavya Sinha', 'bhavya.s@gmail.com', '9876500049', 'victim', TO_DATE('2024-09-15', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Nishant Oza', 'nishant.o@hotmail.com', '9876500050', 'volunteer', TO_DATE('2023-12-05', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Aisha Khan', 'aisha.k@gmail.com', '9876500051', 'victim', TO_DATE('2025-02-05', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Zayn Malik', 'zayn.m@yahoo.com', '9876500052', 'volunteer', TO_DATE('2024-05-10', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Tara Sutaria', 'tara.s@gmail.com', '9876500053', 'victim', TO_DATE('2026-08-14', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Kabir Singh', 'kabir.s@hotmail.com', '9876500054', 'volunteer', TO_DATE('2025-03-25', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Myra Kapoor', 'myra.k@gmail.com', '9876500055', 'victim', TO_DATE('2024-10-22', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Rudra Pratap', 'rudra.p@yahoo.com', '9876500056', 'volunteer', TO_DATE('2023-02-28', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Diya Mirza', 'diya.m@gmail.com', '9876500057', 'victim', TO_DATE('2025-01-15', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Aryan Khan', 'aryan.k@hotmail.com', '9876500058', 'volunteer', TO_DATE('2024-07-19', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Rhea Chakraborty', 'rhea.c@gmail.com', '9876500059', 'victim', TO_DATE('2023-11-11', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Dev Joshi', 'dev.j@yahoo.com', '9876500060', 'volunteer', TO_DATE('2025-02-10', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Kiara Advani', 'kiara.a@gmail.com', '9876500061', 'victim', TO_DATE('2026-01-25', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Vedant Marathe', 'vedant.m@hotmail.com', '9876500062', 'volunteer', TO_DATE('2023-05-05', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Isha Ambani', 'isha.a@gmail.com', '9876500063', 'victim', TO_DATE('2025-03-05', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Shivang Joshi', 'shivang.j@yahoo.com', '9876500064', 'volunteer', TO_DATE('2024-12-20', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Anushka Sen', 'anushka.s@gmail.com', '9876500065', 'victim', TO_DATE('2023-09-12', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Darshan Raval', 'darshan.r@hotmail.com', '9876500066', 'volunteer', TO_DATE('2025-01-08', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Sanjana Sanghi', 'sanjana.s@gmail.com', '9876500067', 'victim', TO_DATE('2024-03-14', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Armaan Malik', 'armaan.m@yahoo.com', '9876500068', 'volunteer', TO_DATE('2023-07-28', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Shruti Haasan', 'shruti.h@gmail.com', '9876500069', 'victim', TO_DATE('2026-02-22', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Kartik Aaryan', 'kartik.a@hotmail.com', '9876500070', 'volunteer', TO_DATE('2024-08-08', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Disha Patani', 'disha.p@gmail.com', '9876500071', 'victim', TO_DATE('2023-10-30', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Ayushmann K', 'ayush.k@yahoo.com', '9876500072', 'volunteer', TO_DATE('2025-03-18', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Kriti Sanon', 'kriti.s@gmail.com', '9876500073', 'victim', TO_DATE('2024-06-16', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Vicky Kaushal', 'vicky.k@hotmail.com', '9876500074', 'volunteer', TO_DATE('2023-01-18', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Bhumi Pednekar', 'bhumi.p@gmail.com', '9876500075', 'victim', TO_DATE('2025-01-28', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Rajkummar Rao', 'rajkummar.r@yahoo.com', '9876500076', 'volunteer', TO_DATE('2024-11-25', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Tapsee Pannu', 'tapsee.p@gmail.com', '9876500077', 'victim', TO_DATE('2026-04-20', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Siddhant C', 'siddhant.c@hotmail.com', '9876500078', 'volunteer', TO_DATE('2025-02-02', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Alia Bhatt', 'alia.b@gmail.com', '9876500079', 'victim', TO_DATE('2024-09-02', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Ranveer Singh', 'ranveer.s@yahoo.com', '9876500080', 'volunteer', TO_DATE('2023-12-18', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Deepika P', 'deepika.p@gmail.com', '9876500081', 'victim', TO_DATE('2025-03-28', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Ranbir Kapoor', 'ranbir.k@hotmail.com', '9876500082', 'volunteer', TO_DATE('2024-05-25', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Katrina Kaif', 'katrina.k@gmail.com', '9876500083', 'victim', TO_DATE('2023-08-05', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Hrithik Roshan', 'hrithik.r@yahoo.com', '9876500084', 'volunteer', TO_DATE('2025-01-18', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Kareena K', 'kareena.k@gmail.com', '9876500085', 'victim', TO_DATE('2024-10-05', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Saif Ali', 'saif.a@hotmail.com', '9876500086', 'volunteer', TO_DATE('2026-03-12', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Priyanka C', 'priyanka.c@gmail.com', '9876500087', 'victim', TO_DATE('2025-02-12', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Nick Jonas', 'nick.j@yahoo.com', '9876500088', 'volunteer', TO_DATE('2024-07-22', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Shahid Kapoor', 'shahid.k@gmail.com', '9876500089', 'victim', TO_DATE('2023-11-20', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Mira Rajput', 'mira.r@hotmail.com', '9876500090', 'volunteer', TO_DATE('2025-03-08', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Virat Kohli', 'virat.k@gmail.com', '9876500091', 'victim', TO_DATE('2024-02-10', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('MS Dhoni', 'ms.dhoni@yahoo.com', '9876500092', 'volunteer', TO_DATE('2023-06-08', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Rohit Sharma', 'rohit.s@gmail.com', '9876500093', 'victim', TO_DATE('2025-01-22', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Shikhar Dhawan', 'shikhar.d@hotmail.com', '9876500094', 'volunteer', TO_DATE('2026-12-01', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Jasprit Bumrah', 'jasprit.b@gmail.com', '9876500095', 'victim', TO_DATE('2023-09-25', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Hardik Pandya', 'hardik.p@yahoo.com', '9876500096', 'volunteer', TO_DATE('2025-02-25', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('KL Rahul', 'kl.rahul@gmail.com', '9876500097', 'victim', TO_DATE('2024-04-28', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Rishabh Pant', 'rishabh.p@hotmail.com', '9876500098', 'volunteer', TO_DATE('2023-07-02', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Shreyas Iyer', 'shreyas.i@gmail.com', '9876500099', 'victim', TO_DATE('2025-03-22', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Suryakumar Y', 'surya.y@yahoo.com', '9876500100', 'volunteer', TO_DATE('2024-10-12', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Ishan Kishan', 'ishan.k@gmail.com', '9876500101', 'admin', TO_DATE('2023-05-18', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Smriti Mandhana', 'smriti.m@yahoo.com', '9876500102', 'victim', TO_DATE('2025-08-09', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Harmanpreet Kaur', 'harman.k@hotmail.com', '9876500103', 'volunteer', TO_DATE('2026-02-14', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Mithali Raj', 'mithali.r@gmail.com', '9876500104', 'victim', TO_DATE('2024-11-30', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Jhulan Goswami', 'jhulan.g@yahoo.com', '9876500105', 'volunteer', TO_DATE('2023-01-22', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Sunil Chhetri', 'sunil.c@gmail.com', '9876500106', 'victim', TO_DATE('2025-09-05', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Neeraj Chopra', 'neeraj.c@hotmail.com', '9876500107', 'volunteer', TO_DATE('2024-07-11', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('PV Sindhu', 'pv.sindhu@gmail.com', '9876500108', 'admin', TO_DATE('2023-03-25', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Mary Kom', 'mary.k@yahoo.com', '9876500109', 'victim', TO_DATE('2026-01-10', 'YYYY-MM-DD'));
INSERT INTO Users (full_name, email, phone, role, created_at) VALUES ('Saina Nehwal', 'saina.n@gmail.com', '9876500110', 'volunteer', TO_DATE('2025-10-18', 'YYYY-MM-DD'));

COMMIT;



select * from users;

-- 2023 Disasters
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Assam Flash Floods', 'flood', 'Guwahati, Assam', TO_DATE('2023-06-15', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Delhi Factory Fire', 'fire', 'Bawana, Delhi', TO_DATE('2023-01-22', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Cyclone Biparjoy', 'cyclone', 'Kutch, Gujarat', TO_DATE('2023-06-06', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Shimla Landslide', 'other', 'Shimla, Himachal Pradesh', TO_DATE('2023-08-14', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Sikkim Earthquake', 'earthquake', 'Gangtok, Sikkim', TO_DATE('2023-10-03', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Mumbai Monsoon Floods', 'flood', 'Mumbai, Maharashtra', TO_DATE('2023-07-20', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Surat Textile Mill Fire', 'fire', 'Surat, Gujarat', TO_DATE('2023-03-11', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Odisha Coastal Cyclone', 'cyclone', 'Puri, Odisha', TO_DATE('2023-05-18', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Uttarakhand Flash Flood', 'flood', 'Chamoli, Uttarakhand', TO_DATE('2023-02-07', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Kashmir Snow Avalanche', 'other', 'Gulmarg, J&K', TO_DATE('2023-01-15', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Jaipur Market Fire', 'fire', 'Jaipur, Rajasthan', TO_DATE('2023-04-09', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Chennai Urban Floods', 'flood', 'Chennai, Tamil Nadu', TO_DATE('2023-11-25', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Andaman Tremors', 'earthquake', 'Port Blair, A&N Islands', TO_DATE('2023-09-12', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Bengaluru Lake Overflow', 'flood', 'Bengaluru, Karnataka', TO_DATE('2023-09-05', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Kolkata Warehouse Fire', 'fire', 'Kolkata, West Bengal', TO_DATE('2023-12-10', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Kerala Coast Cyclone', 'cyclone', 'Kochi, Kerala', TO_DATE('2023-10-22', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Pune Industrial Fire', 'fire', 'Pune, Maharashtra', TO_DATE('2023-05-30', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Meghalaya Heavy Rains', 'flood', 'Cherrapunji, Meghalaya', TO_DATE('2023-06-25', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Manipur Landslide', 'other', 'Imphal, Manipur', TO_DATE('2023-07-08', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Gujarat Minor Quake', 'earthquake', 'Bhuj, Gujarat', TO_DATE('2023-02-18', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Noida High-rise Fire', 'fire', 'Noida, UP', TO_DATE('2023-04-05', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Teesta River Breach', 'flood', 'Jalpaiguri, WB', TO_DATE('2023-07-22', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Rajasthan Sandstorm', 'other', 'Bikaner, Rajasthan', TO_DATE('2023-05-12', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Amritsar Factory Blast', 'other', 'Amritsar, Punjab', TO_DATE('2023-02-18', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Gwalior Minor Quake', 'earthquake', 'Gwalior, MP', TO_DATE('2023-03-05', 'YYYY-MM-DD'), 'resolved');

-- 2024 Disasters
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Cyclone Michaung', 'cyclone', 'Chennai, Tamil Nadu', TO_DATE('2024-12-03', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Sutlej River Breach', 'flood', 'Jalandhar, Punjab', TO_DATE('2024-08-18', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Hyderabad Chemical Fire', 'fire', 'Hyderabad, Telangana', TO_DATE('2024-03-14', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Nepal Border Earthquake', 'earthquake', 'Pithoragarh, Uttarakhand', TO_DATE('2024-11-03', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Goa Forest Fire', 'fire', 'Mhadei, Goa', TO_DATE('2024-04-10', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Brahmaputra Floods', 'flood', 'Dibrugarh, Assam', TO_DATE('2024-07-02', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Visakhapatnam Cyclone', 'cyclone', 'Visakhapatnam, AP', TO_DATE('2024-10-15', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Delhi Smog Emergency', 'other', 'New Delhi, Delhi', TO_DATE('2024-11-10', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Mizoram Mudslide', 'other', 'Aizawl, Mizoram', TO_DATE('2024-06-28', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Lucknow Building Collapse', 'other', 'Lucknow, UP', TO_DATE('2024-02-25', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Patna Waterlogging', 'flood', 'Patna, Bihar', TO_DATE('2024-09-12', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Ahmedabad Hospital Fire', 'fire', 'Ahmedabad, Gujarat', TO_DATE('2024-05-19', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Rohtang Pass Avalanche', 'other', 'Manali, HP', TO_DATE('2024-01-20', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Sundarbans Cyclone', 'cyclone', 'South 24 Parganas, WB', TO_DATE('2024-05-24', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Nagpur Timber Market Fire', 'fire', 'Nagpur, Maharashtra', TO_DATE('2024-03-05', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Kosi River Floods', 'flood', 'Supaul, Bihar', TO_DATE('2024-08-05', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Latur Tremors', 'earthquake', 'Latur, Maharashtra', TO_DATE('2024-09-22', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Rishikesh Flash Flood', 'flood', 'Rishikesh, Uttarakhand', TO_DATE('2024-07-18', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Bhopal Gas Leak Incident', 'other', 'Bhopal, MP', TO_DATE('2024-12-15', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Indore Factory Blaze', 'fire', 'Indore, MP', TO_DATE('2024-02-11', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Tripura Cyclone Alerts', 'cyclone', 'Agartala, Tripura', TO_DATE('2024-11-20', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Munnar Landslide', 'other', 'Idukki, Kerala', TO_DATE('2024-08-10', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Kanpur Chemical Spill', 'other', 'Kanpur, UP', TO_DATE('2024-10-08', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Jammu Earthquake', 'earthquake', 'Doda, J&K', TO_DATE('2024-04-15', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Coimbatore Wildfire', 'fire', 'Coimbatore, TN', TO_DATE('2024-03-28', 'YYYY-MM-DD'), 'resolved');

-- 2025 Disasters
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Himalayan Fault Quake', 'earthquake', 'Dharamshala, HP', TO_DATE('2025-01-12', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Ganga River Floods', 'flood', 'Varanasi, UP', TO_DATE('2025-08-15', 'YYYY-MM-DD'), 'active');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Cyclone Asani', 'cyclone', 'Puducherry', TO_DATE('2025-11-10', 'YYYY-MM-DD'), 'active');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Dehradun Forest Fire', 'fire', 'Dehradun, Uttarakhand', TO_DATE('2025-04-25', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Gaurikund Landslide', 'other', 'Kedarnath, Uttarakhand', TO_DATE('2025-08-01', 'YYYY-MM-DD'), 'active');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Mumbai Coastal Floods', 'flood', 'Navi Mumbai, MH', TO_DATE('2025-07-10', 'YYYY-MM-DD'), 'active');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Chennai Oil Spill', 'other', 'Ennore, TN', TO_DATE('2025-12-05', 'YYYY-MM-DD'), 'active');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Gurgaon Cyber Hub Fire', 'fire', 'Gurugram, Haryana', TO_DATE('2025-09-15', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Silchar Floods', 'flood', 'Silchar, Assam', TO_DATE('2025-06-20', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Andhra Coast Cyclone', 'cyclone', 'Nellore, AP', TO_DATE('2025-10-30', 'YYYY-MM-DD'), 'active');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Palghar Tremors', 'earthquake', 'Palghar, Maharashtra', TO_DATE('2025-02-28', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Faridabad Industrial Fire', 'fire', 'Faridabad, Haryana', TO_DATE('2025-11-20', 'YYYY-MM-DD'), 'active');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Badrinath Road Collapse', 'other', 'Joshimath, Uttarakhand', TO_DATE('2025-07-05', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Cuttack Urban Flooding', 'flood', 'Cuttack, Odisha', TO_DATE('2025-08-25', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Ranchi Lightning Strikes', 'other', 'Ranchi, Jharkhand', TO_DATE('2025-06-12', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Kochi Port Fire', 'fire', 'Kochi, Kerala', TO_DATE('2025-03-22', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Gaya Heatwave', 'other', 'Gaya, Bihar', TO_DATE('2025-05-25', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Tirupati Heavy Rains', 'flood', 'Tirupati, AP', TO_DATE('2025-11-15', 'YYYY-MM-DD'), 'active');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Shillong Earthquake', 'earthquake', 'Shillong, Meghalaya', TO_DATE('2025-09-08', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Rajkot Chemical Fire', 'fire', 'Rajkot, Gujarat', TO_DATE('2025-01-18', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Cyclone Yaas Returns', 'cyclone', 'Balasore, Odisha', TO_DATE('2025-05-20', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Jalgaon Tremors', 'earthquake', 'Jalgaon, MH', TO_DATE('2025-12-10', 'YYYY-MM-DD'), 'active');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Mysore Market Blaze', 'fire', 'Mysuru, Karnataka', TO_DATE('2025-08-14', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Yamuna Overflow', 'flood', 'Agra, UP', TO_DATE('2025-07-28', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Leh Cloudburst', 'other', 'Leh, Ladakh', TO_DATE('2025-08-08', 'YYYY-MM-DD'), 'resolved');

-- 2026 Disasters (Many Active)
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Patiala Winter Floods', 'flood', 'Patiala, Punjab', TO_DATE('2026-02-15', 'YYYY-MM-DD'), 'active');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Chandigarh Grid Failure', 'other', 'Chandigarh', TO_DATE('2026-01-10', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Ludhiana Textile Fire', 'fire', 'Ludhiana, Punjab', TO_DATE('2026-03-05', 'YYYY-MM-DD'), 'active');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Haryana Tremors', 'earthquake', 'Rohtak, Haryana', TO_DATE('2026-04-12', 'YYYY-MM-DD'), 'active');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Thane Chemical Blast', 'fire', 'Thane, MH', TO_DATE('2026-02-28', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Kaziranga Floods', 'flood', 'Golaghat, Assam', TO_DATE('2026-04-20', 'YYYY-MM-DD'), 'active');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Cyclone Remal', 'cyclone', 'Kolkata, WB', TO_DATE('2026-05-01', 'YYYY-MM-DD'), 'active');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Nainital Landslide', 'other', 'Nainital, Uttarakhand', TO_DATE('2026-03-15', 'YYYY-MM-DD'), 'active');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Indore Water Crisis', 'other', 'Indore, MP', TO_DATE('2026-04-05', 'YYYY-MM-DD'), 'active');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Bhopal Factory Fire', 'fire', 'Bhopal, MP', TO_DATE('2026-01-20', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Godavari Basin Floods', 'flood', 'Rajahmundry, AP', TO_DATE('2026-03-10', 'YYYY-MM-DD'), 'active');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Nicobar Deep Quake', 'earthquake', 'Great Nicobar', TO_DATE('2026-02-05', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Cyclone Sitrang Threat', 'cyclone', 'Diamond Harbour, WB', TO_DATE('2026-04-28', 'YYYY-MM-DD'), 'active');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Jharia Coal Mine Fire', 'fire', 'Dhanbad, Jharkhand', TO_DATE('2026-01-15', 'YYYY-MM-DD'), 'active');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Wayanad Mudslide', 'other', 'Wayanad, Kerala', TO_DATE('2026-03-22', 'YYYY-MM-DD'), 'active');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Hooghly River Surge', 'flood', 'Howrah, WB', TO_DATE('2026-04-10', 'YYYY-MM-DD'), 'active');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Guwahati Urban Fire', 'fire', 'Guwahati, Assam', TO_DATE('2026-02-14', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Manali Flash Floods', 'flood', 'Manali, HP', TO_DATE('2026-05-02', 'YYYY-MM-DD'), 'active');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Bhuj Aftershocks', 'earthquake', 'Bhuj, Gujarat', TO_DATE('2026-01-05', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Mangalore Port Cyclone', 'cyclone', 'Mangaluru, Karnataka', TO_DATE('2026-04-15', 'YYYY-MM-DD'), 'active');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Darjeeling Ropeway Incident', 'other', 'Darjeeling, WB', TO_DATE('2026-03-18', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Jabalpur Ordnance Fire', 'fire', 'Jabalpur, MP', TO_DATE('2026-04-25', 'YYYY-MM-DD'), 'active');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Tawi River Floods', 'flood', 'Jammu, J&K', TO_DATE('2026-02-20', 'YYYY-MM-DD'), 'resolved');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Alibaug Minor Quake', 'earthquake', 'Alibaug, MH', TO_DATE('2026-03-30', 'YYYY-MM-DD'), 'active');
INSERT INTO Disaster (disaster_name, disaster_type, location, start_date, status) VALUES ('Pune Tech Park Evacuation', 'other', 'Hinjawadi, Pune', TO_DATE('2026-05-01', 'YYYY-MM-DD'), 'active');

COMMIT;

select * from disaster;


INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Patiala Central Govt School', 'Patiala, Punjab', 500);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Thapar Institute Campus Shelter', 'Patiala, Punjab', 1200);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Ludhiana Indoor Stadium', 'Ludhiana, Punjab', 2000);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Chandigarh Sector 17 Community Center', 'Chandigarh', 400);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Jalandhar Red Cross Building', 'Jalandhar, Punjab', 250);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Amritsar Khalsa College Hall', 'Amritsar, Punjab', 800);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Bawana Industrial Relief Camp', 'Bawana, Delhi', 300);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('NDMC Sports Complex', 'New Delhi, Delhi', 1500);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Gurugram Sector 29 Community Hall', 'Gurugram, Haryana', 600);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Faridabad Town Hall', 'Faridabad, Haryana', 450);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Rohtak District Hospital Wing B', 'Rohtak, Haryana', 150);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Shimla Ridge Maidan Tents', 'Shimla, HP', 350);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Dharamshala Monastery Shelter', 'Dharamshala, HP', 200);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Manali Govt Degree College', 'Manali, HP', 500);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Dehradun Doon School Camp', 'Dehradun, Uttarakhand', 1000);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Rishikesh Ashram Relief Wing', 'Rishikesh, Uttarakhand', 400);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Chamoli Zila Parishad Hall', 'Chamoli, Uttarakhand', 250);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Kedarnath Base Camp Tents', 'Kedarnath, Uttarakhand', 800);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Jammu Tawi Railway Shelter', 'Jammu, J&K', 600);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Srinagar NIT Campus Hall', 'Srinagar, J&K', 1000);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Lucknow Bara Imambara Ground', 'Lucknow, UP', 2500);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Kanpur IIT Relief Tents', 'Kanpur, UP', 1200);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Varanasi BHU Auditorium', 'Varanasi, UP', 1500);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Agra College Grounds', 'Agra, UP', 800);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Noida Expo Mart Shelter', 'Noida, UP', 3000);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Patna Gandhi Maidan Camp', 'Patna, Bihar', 5000);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Gaya District Sports Complex', 'Gaya, Bihar', 700);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Supaul Kosi Relief Center', 'Supaul, Bihar', 400);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Guwahati Cotton University', 'Guwahati, Assam', 1000);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Dibrugarh Tea Estate Godown', 'Dibrugarh, Assam', 300);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Silchar Medical College Wing', 'Silchar, Assam', 250);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Kaziranga Forest Office Camp', 'Golaghat, Assam', 150);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Shillong Polo Grounds Tents', 'Shillong, Meghalaya', 800);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Imphal Khuman Lampak Stadium', 'Imphal, Manipur', 1200);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Aizawl Assam Rifles Ground', 'Aizawl, Mizoram', 500);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Agartala Town Hall', 'Agartala, Tripura', 600);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Gangtok Paljor Stadium', 'Gangtok, Sikkim', 700);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Kolkata Salt Lake Stadium Wing', 'Kolkata, WB', 4000);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Howrah Railway Station Camp', 'Howrah, WB', 1500);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Jalpaiguri Zilla School', 'Jalpaiguri, WB', 450);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Sundarbans Cyclone Shelter 1', 'South 24 Parganas, WB', 300);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Sundarbans Cyclone Shelter 2', 'South 24 Parganas, WB', 300);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Bhubaneswar Kalinga Stadium', 'Bhubaneswar, Odisha', 2000);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Puri Jagannath Temple Trust Camp', 'Puri, Odisha', 1000);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Cuttack Barabati Stadium', 'Cuttack, Odisha', 1500);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Balasore District School', 'Balasore, Odisha', 600);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Ranchi JSCA Stadium', 'Ranchi, Jharkhand', 1200);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Dhanbad Coal Mines Rescue Center', 'Dhanbad, Jharkhand', 400);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Mumbai Dharavi Transit Camp', 'Mumbai, Maharashtra', 1500);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Navi Mumbai CIDCO Exhibition Center', 'Navi Mumbai, MH', 3000);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Pune Balewadi Sports Complex', 'Pune, Maharashtra', 2500);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Nagpur NIT Community Hall', 'Nagpur, Maharashtra', 800);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Thane Municipal School', 'Thane, MH', 500);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Palghar Zilla Parishad Camp', 'Palghar, Maharashtra', 350);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Latur Earthquake Relief Base', 'Latur, Maharashtra', 1000);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Jalgaon District Gymkhana', 'Jalgaon, MH', 400);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Ahmedabad GMDC Ground Tents', 'Ahmedabad, Gujarat', 2000);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Surat Indoor Stadium', 'Surat, Gujarat', 1500);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Rajkot Saurashtra University Camp', 'Rajkot, Gujarat', 1000);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Bhuj Swaminarayan Temple Trust', 'Bhuj, Gujarat', 1200);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Kutch Border Security Base Camp', 'Kutch, Gujarat', 800);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Jaipur Sawai Mansingh Stadium', 'Jaipur, Rajasthan', 2500);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Jodhpur Umaid Bhawan Relief Wing', 'Jodhpur, Rajasthan', 600);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Bikaner Desert Rescue Camp', 'Bikaner, Rajasthan', 300);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Bhopal Tatya Tope Stadium', 'Bhopal, MP', 1000);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Indore Holkar Stadium Shelters', 'Indore, MP', 1200);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Gwalior Fort Base Camp', 'Gwalior, MP', 500);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Jabalpur Cantonment Board Tents', 'Jabalpur, MP', 800);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Chennai Trade Centre Relief Hub', 'Chennai, Tamil Nadu', 4000);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Ennore Port Authority Shelter', 'Ennore, TN', 600);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Coimbatore CODISSIA Grounds', 'Coimbatore, TN', 2500);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Madurai Meenakshi College Hall', 'Madurai, TN', 800);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Kochi Jawaharlal Nehru Stadium', 'Kochi, Kerala', 3000);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Idukki Dam Project Quarters', 'Idukki, Kerala', 400);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Wayanad Tribal Welfare Center', 'Wayanad, Kerala', 250);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Thiruvananthapuram Central School', 'Thiruvananthapuram, Kerala', 900);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Bengaluru Kanteerava Stadium', 'Bengaluru, Karnataka', 2000);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Mysuru Palace Exhibition Grounds', 'Mysuru, Karnataka', 1500);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Mangaluru Port Trust Camp', 'Mangaluru, Karnataka', 700);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Hubballi Railway Institute', 'Hubballi, Karnataka', 500);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Hyderabad Gachibowli Stadium', 'Hyderabad, Telangana', 3500);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Secunderabad Parade Grounds', 'Secunderabad, Telangana', 2000);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Visakhapatnam Port Stadium', 'Visakhapatnam, AP', 1500);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Nellore Coastal Cyclone Center', 'Nellore, AP', 800);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Tirupati SV University Hall', 'Tirupati, AP', 1000);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Rajahmundry Godavari Flood Shelter', 'Rajahmundry, AP', 600);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Port Blair Navy Rescue Base', 'Port Blair, A&N Islands', 1200);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Great Nicobar Campbell Bay Camp', 'Great Nicobar', 300);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Panaji Gymkhana Ground', 'Panaji, Goa', 500);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Mhadei Wildlife Ranger Post', 'Mhadei, Goa', 150);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Puducherry Beach Road Camp', 'Puducherry', 400);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Leh Army Rescue Depot', 'Leh, Ladakh', 800);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Kargil District Helipad Camp', 'Kargil, Ladakh', 400);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Kapurthala Rail Coach Factory Shed', 'Kapurthala, Punjab', 1500);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Bhatinda Military Station Base', 'Bhatinda, Punjab', 2000);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Moga Civil Hospital Annex', 'Moga, Punjab', 200);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Pathankot Air Base Relief Wing', 'Pathankot, Punjab', 1000);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Hoshiarpur Community Center', 'Hoshiarpur, Punjab', 350);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Sangrur Zilla Parishad Hall', 'Sangrur, Punjab', 400);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Ferozepur Border Rescue Camp', 'Ferozepur, Punjab', 500);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Nabha Public High School', 'Nabha, Punjab', 300);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Rajpura Industrial Estate Shed', 'Rajpura, Punjab', 600);
INSERT INTO Relief_Center (center_name, location, capacity) VALUES ('Mohali PCA Stadium Tents', 'Mohali, Punjab', 1200);

COMMIT;

select * from Relief_Center;


-- FOOD CATEGORY
INSERT INTO Resources (resource_name, category, unit) VALUES ('Rice', 'food', 'kg');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Wheat Flour', 'food', 'kg');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Lentils/Dal', 'food', 'kg');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Salt', 'food', 'kg');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Sugar', 'food', 'kg');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Bottled Water 1L', 'food', 'bottles');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Bottled Water 5L', 'food', 'bottles');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Glucose Biscuits', 'food', 'packets');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Milk Powder', 'food', 'kg');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Baby Food Formula', 'food', 'boxes');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Cooking Oil', 'food', 'liters');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Canned Vegetables', 'food', 'cans');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Ready-to-eat Meals', 'food', 'packets');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Tea Leaves', 'food', 'kg');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Energy Bars', 'food', 'boxes');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Dry Fruits Mix', 'food', 'kg');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Poha/Flattened Rice', 'food', 'kg');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Jaggery', 'food', 'kg');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Soya Chunks', 'food', 'kg');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Roasted Gram/Chana', 'food', 'kg');

-- MEDICINE CATEGORY
INSERT INTO Resources (resource_name, category, unit) VALUES ('Paracetamol 500mg', 'medicine', 'strips');
INSERT INTO Resources (resource_name, category, unit) VALUES ('ORS Packets', 'medicine', 'sachets');
INSERT INTO Resources (resource_name, category, unit) VALUES ('First Aid Kits', 'medicine', 'boxes');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Antiseptic Liquid', 'medicine', 'bottles');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Cotton Rolls', 'medicine', 'rolls');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Band-Aids', 'medicine', 'boxes');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Gauze Rolls', 'medicine', 'rolls');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Betadine Ointment', 'medicine', 'tubes');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Ibuprofen 400mg', 'medicine', 'strips');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Anti-allergy (Cetirizine)', 'medicine', 'strips');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Antibiotics (Amoxicillin)', 'medicine', 'strips');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Cough Syrup', 'medicine', 'bottles');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Antacid Tablets', 'medicine', 'strips');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Water Purification Tablets', 'medicine', 'strips');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Mosquito Repellent Cream', 'medicine', 'tubes');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Hand Sanitizer 500ml', 'medicine', 'bottles');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Surgical Masks', 'medicine', 'boxes');
INSERT INTO Resources (resource_name, category, unit) VALUES ('N95 Masks', 'medicine', 'boxes');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Disposable Gloves', 'medicine', 'boxes');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Digital Thermometers', 'medicine', 'pieces');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Blood Pressure Monitors', 'medicine', 'pieces');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Oxygen Cylinders', 'medicine', 'cylinders');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Asthma Inhalers', 'medicine', 'pieces');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Syringes 5ml', 'medicine', 'boxes');
INSERT INTO Resources (resource_name, category, unit) VALUES ('IV Fluid Bags', 'medicine', 'bags');

-- SHELTER CATEGORY
INSERT INTO Resources (resource_name, category, unit) VALUES ('Family Tents', 'shelter', 'tents');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Tarpaulin Sheets', 'shelter', 'sheets');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Sleeping Bags', 'shelter', 'pieces');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Inflatable Mattresses', 'shelter', 'pieces');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Mosquito Nets', 'shelter', 'pieces');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Portable Toilets', 'shelter', 'units');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Solar Lanterns', 'shelter', 'pieces');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Heavy Duty Flashlights', 'shelter', 'pieces');
INSERT INTO Resources (resource_name, category, unit) VALUES ('AA Batteries', 'shelter', 'boxes');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Portable Generators', 'shelter', 'units');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Nylon Ropes 50m', 'shelter', 'coils');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Folding Camp Beds', 'shelter', 'pieces');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Multi-tool Kits', 'shelter', 'kits');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Camp Stoves', 'shelter', 'units');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Butane Gas Canisters', 'shelter', 'cans');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Matchboxes', 'shelter', 'cartons');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Candles', 'shelter', 'boxes');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Plastic Chairs', 'shelter', 'pieces');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Folding Tables', 'shelter', 'pieces');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Fire Extinguishers', 'shelter', 'units');

-- CLOTHING CATEGORY
INSERT INTO Resources (resource_name, category, unit) VALUES ('Woolen Blankets', 'clothing', 'pieces');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Cotton Bed sheets', 'clothing', 'pieces');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Mens T-Shirts', 'clothing', 'pieces');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Mens Trousers', 'clothing', 'pieces');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Womens Kurtas', 'clothing', 'pieces');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Womens Leggings', 'clothing', 'pieces');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Kids Clothing Sets', 'clothing', 'sets');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Winter Jackets', 'clothing', 'pieces');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Woolen Sweaters', 'clothing', 'pieces');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Raincoats', 'clothing', 'pieces');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Gum Boots', 'clothing', 'pairs');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Thermal Innerwear', 'clothing', 'sets');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Socks', 'clothing', 'pairs');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Undergarments - Men', 'clothing', 'pieces');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Undergarments - Women', 'clothing', 'pieces');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Bath Towels', 'clothing', 'pieces');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Handkerchiefs', 'clothing', 'packs');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Winter Gloves', 'clothing', 'pairs');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Woolen Caps/Beanies', 'clothing', 'pieces');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Slippers/Flip Flops', 'clothing', 'pairs');

-- OTHER CATEGORY
INSERT INTO Resources (resource_name, category, unit) VALUES ('Sanitary Pads', 'other', 'packs');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Baby Diapers', 'other', 'packs');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Adult Diapers', 'other', 'packs');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Bathing Soap', 'other', 'bars');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Washing Detergent', 'other', 'kg');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Toothpaste', 'other', 'tubes');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Toothbrushes', 'other', 'pieces');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Plastic Buckets', 'other', 'pieces');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Plastic Mugs', 'other', 'pieces');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Bleaching Powder', 'other', 'kg');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Phenyl/Floor Cleaner', 'other', 'liters');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Garbage Bags', 'other', 'rolls');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Life Jackets', 'other', 'pieces');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Rescue Boats (Inflatable)', 'other', 'units');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Safety Helmets', 'other', 'pieces');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Megaphones/Bullhorns', 'other', 'pieces');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Emergency Whistles', 'other', 'pieces');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Reflective Safety Vests', 'other', 'pieces');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Medical Stretchers', 'other', 'pieces');
INSERT INTO Resources (resource_name, category, unit) VALUES ('Power Banks 10000mAh', 'other', 'pieces');

COMMIT;

select * from resources;



-- Center 1: Patiala Central Govt School
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (1, 1, 500, TO_DATE('2026-02-16', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (6, 1, 1200, TO_DATE('2026-02-16', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (21, 1, 300, TO_DATE('2026-02-17', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (46, 1, 50, TO_DATE('2026-02-15', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (66, 1, 200, TO_DATE('2026-02-18', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (86, 1, 150, TO_DATE('2026-02-16', 'YYYY-MM-DD'));

-- Center 2: Thapar Institute Campus Shelter
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (2, 2, 800, TO_DATE('2026-03-01', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (7, 2, 400, TO_DATE('2026-03-02', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (22, 2, 600, TO_DATE('2026-03-01', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (47, 2, 100, TO_DATE('2026-02-28', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (67, 2, 350, TO_DATE('2026-03-03', 'YYYY-MM-DD'));

-- Center 15: Dehradun Doon School Camp
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (3, 15, 450, TO_DATE('2025-04-26', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (8, 15, 2000, TO_DATE('2025-04-26', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (23, 15, 120, TO_DATE('2025-04-27', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (48, 15, 400, TO_DATE('2025-04-28', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (68, 15, 80, TO_DATE('2025-04-25', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (87, 15, 300, TO_DATE('2025-04-29', 'YYYY-MM-DD'));

-- Center 25: Noida Expo Mart Shelter
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (4, 25, 1500, TO_DATE('2025-04-06', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (9, 25, 250, TO_DATE('2025-04-07', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (24, 25, 100, TO_DATE('2025-04-06', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (49, 25, 60, TO_DATE('2025-04-08', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (69, 25, 900, TO_DATE('2025-04-09', 'YYYY-MM-DD'));

-- Center 38: Kolkata Salt Lake Stadium Wing
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (5, 38, 5000, TO_DATE('2026-05-02', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (10, 38, 1200, TO_DATE('2026-05-03', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (25, 38, 800, TO_DATE('2026-05-02', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (50, 38, 300, TO_DATE('2026-05-04', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (70, 38, 450, TO_DATE('2026-05-01', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (88, 38, 1000, TO_DATE('2026-05-05', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (101, 38, 200, TO_DATE('2026-05-02', 'YYYY-MM-DD'));

-- Center 50: Navi Mumbai CIDCO Exhibition Center
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (1, 50, 3000, TO_DATE('2025-07-11', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (6, 50, 8000, TO_DATE('2025-07-12', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (11, 50, 450, TO_DATE('2025-07-11', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (26, 50, 1500, TO_DATE('2025-07-13', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (51, 50, 250, TO_DATE('2025-07-14', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (71, 50, 600, TO_DATE('2025-07-11', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (89, 50, 1200, TO_DATE('2025-07-15', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (102, 50, 50, TO_DATE('2025-07-12', 'YYYY-MM-DD'));

-- Center 65: Jaipur Sawai Mansingh Stadium
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (12, 65, 800, TO_DATE('2024-01-31', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (27, 65, 300, TO_DATE('2024-02-01', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (52, 65, 120, TO_DATE('2024-01-31', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (72, 65, 500, TO_DATE('2024-02-02', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (90, 65, 200, TO_DATE('2024-02-03', 'YYYY-MM-DD'));

-- Center 72: Chennai Trade Centre Relief Hub
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (13, 72, 5000, TO_DATE('2024-12-04', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (28, 72, 850, TO_DATE('2024-12-05', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (53, 72, 1000, TO_DATE('2024-12-04', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (73, 72, 1500, TO_DATE('2024-12-06', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (91, 72, 3000, TO_DATE('2024-12-07', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (103, 72, 250, TO_DATE('2024-12-05', 'YYYY-MM-DD'));

-- Center 80: Bengaluru Kanteerava Stadium
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (14, 80, 400, TO_DATE('2023-09-06', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (29, 80, 600, TO_DATE('2023-09-07', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (54, 80, 150, TO_DATE('2023-09-06', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (74, 80, 800, TO_DATE('2023-09-08', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (92, 80, 350, TO_DATE('2023-09-09', 'YYYY-MM-DD'));

-- Center 84: Hyderabad Gachibowli Stadium
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (15, 84, 1200, TO_DATE('2024-03-15', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (30, 84, 450, TO_DATE('2024-03-16', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (55, 84, 80, TO_DATE('2024-03-15', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (75, 84, 500, TO_DATE('2024-03-17', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (93, 84, 250, TO_DATE('2024-03-18', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (104, 84, 100, TO_DATE('2024-03-16', 'YYYY-MM-DD'));

-- Center 92: Leh Army Rescue Depot
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (16, 92, 300, TO_DATE('2025-08-09', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (31, 92, 150, TO_DATE('2025-08-10', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (56, 92, 500, TO_DATE('2025-08-09', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (76, 92, 1000, TO_DATE('2025-08-11', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (94, 92, 200, TO_DATE('2025-08-12', 'YYYY-MM-DD'));

-- Center 100: Ferozepur Border Rescue Camp
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (17, 100, 600, TO_DATE('2026-02-21', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (32, 100, 200, TO_DATE('2026-02-22', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (57, 100, 100, TO_DATE('2026-02-21', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (77, 100, 450, TO_DATE('2026-02-23', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (95, 100, 150, TO_DATE('2026-02-24', 'YYYY-MM-DD'));

-- Random Fill-ins across various centers to hit 109 exactly
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (18, 3, 400, TO_DATE('2026-03-06', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (33, 4, 150, TO_DATE('2026-01-11', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (58, 5, 200, TO_DATE('2024-08-19', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (78, 6, 800, TO_DATE('2025-02-19', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (96, 7, 300, TO_DATE('2023-01-23', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (19, 8, 1000, TO_DATE('2024-11-11', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (34, 9, 250, TO_DATE('2025-09-16', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (59, 10, 100, TO_DATE('2025-11-21', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (79, 11, 400, TO_DATE('2026-04-13', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (97, 12, 150, TO_DATE('2023-08-15', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (20, 13, 120, TO_DATE('2025-01-13', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (35, 14, 500, TO_DATE('2026-05-03', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (60, 16, 50, TO_DATE('2024-07-19', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (80, 17, 300, TO_DATE('2023-02-08', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (98, 18, 600, TO_DATE('2025-08-02', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (1, 19, 1500, TO_DATE('2024-04-16', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (36, 20, 800, TO_DATE('2024-04-17', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (61, 21, 200, TO_DATE('2024-02-26', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (81, 22, 1000, TO_DATE('2024-10-09', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (99, 23, 250, TO_DATE('2025-08-16', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (2, 24, 700, TO_DATE('2025-07-29', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (37, 26, 450, TO_DATE('2024-09-13', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (62, 27, 100, TO_DATE('2025-05-26', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (82, 28, 500, TO_DATE('2024-08-06', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (100, 29, 300, TO_DATE('2023-06-16', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (3, 30, 200, TO_DATE('2024-07-03', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (38, 31, 150, TO_DATE('2025-06-21', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (63, 32, 50, TO_DATE('2026-04-21', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (83, 33, 400, TO_DATE('2025-09-09', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (105, 34, 200, TO_DATE('2023-07-09', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (4, 35, 350, TO_DATE('2024-06-29', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (39, 36, 120, TO_DATE('2024-11-21', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (64, 37, 80, TO_DATE('2023-10-04', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (84, 39, 600, TO_DATE('2026-04-11', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (6, 40, 1000, TO_DATE('2025-07-23', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (40, 41, 150, TO_DATE('2024-05-25', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (65, 42, 200, TO_DATE('2024-05-25', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (85, 43, 800, TO_DATE('2024-05-16', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (10, 44, 400, TO_DATE('2023-05-19', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (41, 45, 300, TO_DATE('2025-08-26', 'YYYY-MM-DD'));
INSERT INTO Resource_Stock (resource_id, center_id, quantity, last_updated) VALUES (66, 46, 250, TO_DATE('2025-05-21', 'YYYY-MM-DD'));

COMMIT;

select * from Resource_Stock;





INSERT INTO Volunteer (user_id, skill, availability) VALUES (1, 'First Aid & CPR', 'deployed');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (2, 'Search and Rescue', 'available');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (3, 'Logistics & Distribution', 'deployed');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (4, 'Heavy Vehicle Driving', 'available');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (5, 'Crowd Management', 'inactive');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (6, 'Psychological Counseling', 'available');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (7, 'Water Rescue', 'deployed');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (8, 'Debris Clearing', 'available');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (9, 'Firefighting', 'deployed');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (10, 'Radio Communication', 'available');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (11, 'Food Preparation', 'deployed');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (12, 'First Aid & CPR', 'available');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (13, 'Medical Assistance (Nursing)', 'deployed');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (14, 'Logistics & Distribution', 'available');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (15, 'Search and Rescue', 'inactive');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (16, 'Translation & Local Guide', 'available');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (17, 'Heavy Vehicle Driving', 'deployed');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (18, 'Drone Operation (Survey)', 'available');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (19, 'Water Rescue', 'deployed');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (20, 'First Aid & CPR', 'available');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (21, 'Crowd Management', 'deployed');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (22, 'Food Preparation', 'available');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (23, 'Psychological Counseling', 'inactive');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (24, 'Search and Rescue', 'deployed');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (25, 'Radio Communication', 'available');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (26, 'Debris Clearing', 'deployed');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (27, 'First Aid & CPR', 'available');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (28, 'Medical Assistance (Doctor)', 'deployed');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (29, 'Logistics & Distribution', 'available');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (30, 'Firefighting', 'deployed');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (31, 'Heavy Machinery Operation', 'available');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (32, 'Translation & Local Guide', 'inactive');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (33, 'Water Rescue', 'deployed');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (34, 'Search and Rescue', 'available');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (35, 'Food Preparation', 'deployed');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (36, 'Crowd Management', 'available');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (37, 'First Aid & CPR', 'deployed');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (38, 'Logistics & Distribution', 'available');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (39, 'Radio Communication', 'inactive');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (40, 'Psychological Counseling', 'deployed');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (41, 'Search and Rescue', 'available');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (42, 'Debris Clearing', 'deployed');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (43, 'Heavy Vehicle Driving', 'available');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (44, 'Medical Assistance (Nursing)', 'deployed');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (45, 'First Aid & CPR', 'available');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (46, 'Water Rescue', 'inactive');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (47, 'Firefighting', 'deployed');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (48, 'Food Preparation', 'available');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (49, 'Crowd Management', 'deployed');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (50, 'Logistics & Distribution', 'available');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (51, 'Search and Rescue', 'deployed');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (52, 'Translation & Local Guide', 'available');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (53, 'First Aid & CPR', 'inactive');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (54, 'Radio Communication', 'deployed');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (55, 'Drone Operation (Survey)', 'available');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (56, 'Debris Clearing', 'deployed');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (57, 'Psychological Counseling', 'available');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (58, 'Heavy Machinery Operation', 'deployed');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (59, 'Search and Rescue', 'available');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (60, 'Water Rescue', 'inactive');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (61, 'First Aid & CPR', 'deployed');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (62, 'Logistics & Distribution', 'available');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (63, 'Food Preparation', 'deployed');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (64, 'Crowd Management', 'available');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (65, 'Firefighting', 'deployed');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (66, 'Medical Assistance (Doctor)', 'available');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (67, 'Search and Rescue', 'inactive');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (68, 'Translation & Local Guide', 'deployed');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (69, 'Heavy Vehicle Driving', 'available');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (70, 'First Aid & CPR', 'deployed');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (71, 'Radio Communication', 'available');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (72, 'Debris Clearing', 'deployed');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (73, 'Logistics & Distribution', 'available');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (74, 'Psychological Counseling', 'inactive');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (75, 'Water Rescue', 'deployed');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (76, 'Search and Rescue', 'available');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (77, 'Food Preparation', 'deployed');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (78, 'Crowd Management', 'available');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (79, 'First Aid & CPR', 'deployed');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (80, 'Firefighting', 'available');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (81, 'Heavy Machinery Operation', 'inactive');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (82, 'Medical Assistance (Nursing)', 'deployed');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (83, 'Logistics & Distribution', 'available');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (84, 'Search and Rescue', 'deployed');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (85, 'Translation & Local Guide', 'available');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (86, 'Radio Communication', 'deployed');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (87, 'Debris Clearing', 'available');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (88, 'First Aid & CPR', 'inactive');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (89, 'Water Rescue', 'deployed');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (90, 'Food Preparation', 'available');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (91, 'Logistics & Distribution', 'deployed');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (92, 'Crowd Management', 'available');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (93, 'Psychological Counseling', 'deployed');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (94, 'Search and Rescue', 'available');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (95, 'Firefighting', 'inactive');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (96, 'Heavy Vehicle Driving', 'deployed');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (97, 'First Aid & CPR', 'available');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (98, 'Medical Assistance (Doctor)', 'deployed');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (99, 'Drone Operation (Survey)', 'available');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (100, 'Logistics & Distribution', 'deployed');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (101, 'Translation & Local Guide', 'available');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (102, 'Water Rescue', 'inactive');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (103, 'Search and Rescue', 'deployed');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (104, 'Food Preparation', 'available');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (105, 'Radio Communication', 'deployed');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (106, 'Debris Clearing', 'available');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (107, 'First Aid & CPR', 'deployed');
INSERT INTO Volunteer (user_id, skill, availability) VALUES (108, 'Crowd Management', 'available');

COMMIT;


select * from volunteer;



-- 2024 Assignments (Completed)
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (1, 1, TO_DATE('2024-01-15', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (2, 2, TO_DATE('2024-01-20', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (3, 3, TO_DATE('2024-02-10', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (4, 4, TO_DATE('2024-02-14', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (5, 5, TO_DATE('2024-03-05', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (6, 6, TO_DATE('2024-03-12', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (7, 7, TO_DATE('2024-04-01', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (8, 8, TO_DATE('2024-04-15', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (9, 9, TO_DATE('2024-05-10', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (10, 10, TO_DATE('2024-05-22', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (11, 11, TO_DATE('2024-06-05', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (12, 12, TO_DATE('2024-06-18', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (13, 13, TO_DATE('2024-07-02', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (14, 14, TO_DATE('2024-07-15', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (15, 15, TO_DATE('2024-08-01', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (16, 16, TO_DATE('2024-08-14', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (17, 17, TO_DATE('2024-09-05', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (18, 18, TO_DATE('2024-09-20', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (19, 19, TO_DATE('2024-10-05', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (20, 20, TO_DATE('2024-10-18', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (21, 21, TO_DATE('2024-11-01', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (22, 22, TO_DATE('2024-11-15', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (23, 23, TO_DATE('2024-12-05', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (24, 24, TO_DATE('2024-12-20', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (25, 25, TO_DATE('2024-01-25', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (26, 26, TO_DATE('2024-02-28', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (27, 27, TO_DATE('2024-03-25', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (28, 28, TO_DATE('2024-04-28', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (29, 29, TO_DATE('2024-05-25', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (30, 30, TO_DATE('2024-06-28', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (31, 31, TO_DATE('2024-07-25', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (32, 32, TO_DATE('2024-08-28', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (33, 33, TO_DATE('2024-09-25', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (34, 34, TO_DATE('2024-10-28', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (35, 35, TO_DATE('2024-11-25', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (36, 36, TO_DATE('2024-12-28', 'YYYY-MM-DD'), 'completed');

-- 2025 Assignments (Completed)
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (37, 37, TO_DATE('2025-01-10', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (38, 38, TO_DATE('2025-01-20', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (39, 39, TO_DATE('2025-02-05', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (40, 40, TO_DATE('2025-02-15', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (41, 41, TO_DATE('2025-03-01', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (42, 42, TO_DATE('2025-03-12', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (43, 43, TO_DATE('2025-04-05', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (44, 44, TO_DATE('2025-04-18', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (45, 45, TO_DATE('2025-05-10', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (46, 46, TO_DATE('2025-05-22', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (47, 47, TO_DATE('2025-06-05', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (48, 48, TO_DATE('2025-06-20', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (49, 49, TO_DATE('2025-07-08', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (50, 50, TO_DATE('2025-07-22', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (51, 51, TO_DATE('2025-08-05', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (52, 52, TO_DATE('2025-08-18', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (53, 53, TO_DATE('2025-09-02', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (54, 54, TO_DATE('2025-09-15', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (55, 55, TO_DATE('2025-10-01', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (56, 56, TO_DATE('2025-10-14', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (57, 57, TO_DATE('2025-11-05', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (58, 58, TO_DATE('2025-11-20', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (59, 59, TO_DATE('2025-12-05', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (60, 60, TO_DATE('2025-12-18', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (61, 61, TO_DATE('2025-01-25', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (62, 62, TO_DATE('2025-02-28', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (63, 63, TO_DATE('2025-03-25', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (64, 64, TO_DATE('2025-04-28', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (65, 65, TO_DATE('2025-05-25', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (66, 66, TO_DATE('2025-06-28', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (67, 67, TO_DATE('2025-07-25', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (68, 68, TO_DATE('2025-08-28', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (69, 69, TO_DATE('2025-09-25', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (70, 70, TO_DATE('2025-10-28', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (71, 71, TO_DATE('2025-11-25', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (72, 72, TO_DATE('2025-12-28', 'YYYY-MM-DD'), 'completed');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (73, 73, TO_DATE('2025-07-15', 'YYYY-MM-DD'), 'completed');

-- 2026 Assignments (Active / Recent)
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (74, 74, TO_DATE('2026-01-05', 'YYYY-MM-DD'), 'active');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (75, 75, TO_DATE('2026-01-12', 'YYYY-MM-DD'), 'active');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (76, 76, TO_DATE('2026-01-18', 'YYYY-MM-DD'), 'active');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (77, 77, TO_DATE('2026-01-25', 'YYYY-MM-DD'), 'active');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (78, 78, TO_DATE('2026-02-02', 'YYYY-MM-DD'), 'active');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (79, 79, TO_DATE('2026-02-10', 'YYYY-MM-DD'), 'active');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (80, 80, TO_DATE('2026-02-15', 'YYYY-MM-DD'), 'active');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (81, 81, TO_DATE('2026-02-20', 'YYYY-MM-DD'), 'active');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (82, 82, TO_DATE('2026-02-28', 'YYYY-MM-DD'), 'active');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (83, 83, TO_DATE('2026-03-05', 'YYYY-MM-DD'), 'active');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (84, 84, TO_DATE('2026-03-10', 'YYYY-MM-DD'), 'active');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (85, 85, TO_DATE('2026-03-15', 'YYYY-MM-DD'), 'active');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (86, 86, TO_DATE('2026-03-20', 'YYYY-MM-DD'), 'active');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (87, 87, TO_DATE('2026-03-25', 'YYYY-MM-DD'), 'active');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (88, 88, TO_DATE('2026-04-01', 'YYYY-MM-DD'), 'active');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (89, 89, TO_DATE('2026-04-05', 'YYYY-MM-DD'), 'active');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (90, 90, TO_DATE('2026-04-10', 'YYYY-MM-DD'), 'active');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (91, 91, TO_DATE('2026-04-15', 'YYYY-MM-DD'), 'active');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (92, 92, TO_DATE('2026-04-20', 'YYYY-MM-DD'), 'active');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (93, 93, TO_DATE('2026-04-25', 'YYYY-MM-DD'), 'active');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (94, 94, TO_DATE('2026-05-01', 'YYYY-MM-DD'), 'active');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (95, 95, TO_DATE('2026-05-02', 'YYYY-MM-DD'), 'active');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (96, 96, TO_DATE('2026-05-02', 'YYYY-MM-DD'), 'active');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (97, 97, TO_DATE('2026-05-02', 'YYYY-MM-DD'), 'active');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (98, 98, TO_DATE('2026-05-02', 'YYYY-MM-DD'), 'active');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (99, 99, TO_DATE('2026-05-02', 'YYYY-MM-DD'), 'active');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (100, 100, TO_DATE('2026-05-02', 'YYYY-MM-DD'), 'active');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (101, 101, TO_DATE('2026-05-02', 'YYYY-MM-DD'), 'active');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (102, 102, TO_DATE('2026-05-02', 'YYYY-MM-DD'), 'active');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (103, 103, TO_DATE('2026-05-02', 'YYYY-MM-DD'), 'active');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (104, 1, TO_DATE('2026-05-02', 'YYYY-MM-DD'), 'active');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (105, 2, TO_DATE('2026-05-02', 'YYYY-MM-DD'), 'active');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (106, 3, TO_DATE('2026-05-02', 'YYYY-MM-DD'), 'active');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (107, 4, TO_DATE('2026-05-02', 'YYYY-MM-DD'), 'active');
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (108, 5, TO_DATE('2026-05-02', 'YYYY-MM-DD'), 'active');

-- Volunteer ID 1 returning for a second assignment
INSERT INTO Volunteer_Assignment (volunteer_id, center_id, assigned_date, status) VALUES (1, 6, TO_DATE('2026-05-02', 'YYYY-MM-DD'), 'active');

COMMIT;


select * from volunteer_assignment;



-- 2024 Requests
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (2, 26, 1, 50, TO_DATE('2024-12-04', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (6, 27, 6, 100, TO_DATE('2024-08-19', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (8, 28, 21, 20, TO_DATE('2024-03-15', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (12, 29, 46, 5, TO_DATE('2024-11-04', 'YYYY-MM-DD'), 'rejected');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (14, 30, 66, 10, TO_DATE('2024-04-11', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (16, 31, 86, 15, TO_DATE('2024-07-03', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (18, 32, 2, 40, TO_DATE('2024-10-16', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (21, 33, 7, 200, TO_DATE('2024-11-11', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (23, 34, 22, 50, TO_DATE('2024-06-29', 'YYYY-MM-DD'), 'pending');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (25, 35, 47, 10, TO_DATE('2024-02-26', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (27, 36, 67, 25, TO_DATE('2024-09-13', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (29, 37, 87, 5, TO_DATE('2024-05-20', 'YYYY-MM-DD'), 'rejected');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (31, 38, 3, 30, TO_DATE('2024-01-21', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (33, 39, 8, 100, TO_DATE('2024-05-25', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (35, 40, 23, 15, TO_DATE('2024-03-06', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (37, 41, 48, 8, TO_DATE('2024-08-06', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (39, 42, 68, 20, TO_DATE('2024-09-23', 'YYYY-MM-DD'), 'pending');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (41, 43, 88, 50, TO_DATE('2024-07-19', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (43, 44, 4, 25, TO_DATE('2024-12-16', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (45, 45, 9, 10, TO_DATE('2024-02-12', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (47, 46, 24, 100, TO_DATE('2024-11-21', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (49, 47, 49, 15, TO_DATE('2024-08-11', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (51, 48, 69, 5, TO_DATE('2024-10-09', 'YYYY-MM-DD'), 'rejected');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (53, 49, 89, 40, TO_DATE('2024-04-16', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (55, 50, 5, 60, TO_DATE('2024-03-29', 'YYYY-MM-DD'), 'approved');

-- 2025 Requests
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (57, 51, 10, 20, TO_DATE('2025-01-13', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (59, 52, 25, 50, TO_DATE('2025-08-16', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (61, 53, 50, 10, TO_DATE('2025-11-11', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (63, 54, 70, 30, TO_DATE('2025-04-26', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (65, 55, 90, 15, TO_DATE('2025-08-02', 'YYYY-MM-DD'), 'pending');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (67, 56, 11, 25, TO_DATE('2025-07-11', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (69, 57, 26, 100, TO_DATE('2025-12-06', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (71, 58, 51, 5, TO_DATE('2025-09-16', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (73, 59, 71, 40, TO_DATE('2025-06-21', 'YYYY-MM-DD'), 'rejected');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (75, 60, 91, 10, TO_DATE('2025-10-31', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (77, 61, 12, 30, TO_DATE('2025-03-01', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (79, 62, 27, 20, TO_DATE('2025-11-21', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (81, 63, 52, 10, TO_DATE('2025-07-06', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (83, 64, 72, 15, TO_DATE('2025-08-26', 'YYYY-MM-DD'), 'pending');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (85, 65, 92, 50, TO_DATE('2025-06-13', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (87, 66, 13, 25, TO_DATE('2025-03-23', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (89, 67, 28, 5, TO_DATE('2025-05-26', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (91, 68, 53, 100, TO_DATE('2025-11-16', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (93, 69, 73, 20, TO_DATE('2025-09-09', 'YYYY-MM-DD'), 'rejected');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (95, 70, 93, 15, TO_DATE('2025-01-19', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (97, 71, 14, 50, TO_DATE('2025-05-21', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (99, 72, 29, 30, TO_DATE('2025-12-11', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (101, 73, 54, 5, TO_DATE('2025-08-15', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (103, 74, 74, 10, TO_DATE('2025-07-29', 'YYYY-MM-DD'), 'pending');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (105, 75, 94, 25, TO_DATE('2025-08-09', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (2, 75, 15, 40, TO_DATE('2025-08-10', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (4, 74, 30, 100, TO_DATE('2025-07-30', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (6, 73, 55, 15, TO_DATE('2025-08-16', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (8, 72, 75, 5, TO_DATE('2025-12-12', 'YYYY-MM-DD'), 'rejected');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (10, 71, 95, 20, TO_DATE('2025-05-22', 'YYYY-MM-DD'), 'approved');

-- 2026 Requests (Recent)
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (12, 76, 16, 50, TO_DATE('2026-02-16', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (14, 77, 31, 200, TO_DATE('2026-01-11', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (16, 78, 56, 30, TO_DATE('2026-03-06', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (18, 79, 76, 10, TO_DATE('2026-04-13', 'YYYY-MM-DD'), 'pending');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (20, 80, 96, 25, TO_DATE('2026-03-01', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (22, 81, 17, 100, TO_DATE('2026-04-21', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (24, 82, 32, 15, TO_DATE('2026-05-02', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (26, 83, 57, 5, TO_DATE('2026-03-16', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (28, 84, 77, 40, TO_DATE('2026-04-06', 'YYYY-MM-DD'), 'rejected');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (30, 85, 97, 10, TO_DATE('2026-01-21', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (32, 86, 18, 50, TO_DATE('2026-03-11', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (34, 87, 33, 20, TO_DATE('2026-02-06', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (36, 88, 58, 30, TO_DATE('2026-04-29', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (38, 89, 78, 15, TO_DATE('2026-01-16', 'YYYY-MM-DD'), 'pending');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (40, 90, 98, 100, TO_DATE('2026-03-23', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (42, 91, 19, 5, TO_DATE('2026-04-11', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (44, 92, 34, 25, TO_DATE('2026-02-15', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (46, 93, 59, 10, TO_DATE('2026-05-03', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (48, 94, 79, 50, TO_DATE('2026-01-06', 'YYYY-MM-DD'), 'rejected');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (50, 95, 99, 40, TO_DATE('2026-04-16', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (52, 96, 20, 15, TO_DATE('2026-03-19', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (54, 97, 35, 100, TO_DATE('2026-04-26', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (56, 98, 60, 20, TO_DATE('2026-02-21', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (58, 99, 80, 5, TO_DATE('2026-03-31', 'YYYY-MM-DD'), 'pending');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (60, 100, 100, 30, TO_DATE('2026-05-02', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (62, 76, 36, 10, TO_DATE('2026-02-17', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (64, 77, 61, 50, TO_DATE('2026-01-12', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (66, 78, 81, 15, TO_DATE('2026-03-07', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (68, 79, 101, 25, TO_DATE('2026-04-14', 'YYYY-MM-DD'), 'rejected');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (70, 80, 37, 100, TO_DATE('2026-03-02', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (72, 81, 62, 5, TO_DATE('2026-04-22', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (74, 82, 82, 40, TO_DATE('2026-05-03', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (76, 83, 102, 10, TO_DATE('2026-03-17', 'YYYY-MM-DD'), 'pending');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (78, 84, 38, 30, TO_DATE('2026-04-07', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (80, 85, 63, 15, TO_DATE('2026-01-22', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (82, 86, 83, 50, TO_DATE('2026-03-12', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (84, 87, 103, 100, TO_DATE('2026-02-07', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (86, 88, 39, 5, TO_DATE('2026-04-30', 'YYYY-MM-DD'), 'rejected');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (88, 89, 64, 25, TO_DATE('2026-01-17', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (90, 90, 84, 40, TO_DATE('2026-03-24', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (92, 91, 104, 10, TO_DATE('2026-04-12', 'YYYY-MM-DD'), 'pending');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (94, 92, 40, 30, TO_DATE('2026-02-16', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (96, 93, 65, 50, TO_DATE('2026-05-04', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (98, 94, 85, 15, TO_DATE('2026-01-07', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (100, 95, 105, 100, TO_DATE('2026-04-17', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (102, 96, 41, 5, TO_DATE('2026-03-20', 'YYYY-MM-DD'), 'rejected');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (104, 97, 66, 40, TO_DATE('2026-04-27', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (106, 98, 86, 10, TO_DATE('2026-02-22', 'YYYY-MM-DD'), 'approved');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (108, 99, 42, 25, TO_DATE('2026-04-01', 'YYYY-MM-DD'), 'pending');
INSERT INTO Request (user_id, disaster_id, resource_id, quantity, request_date, status) VALUES (110, 100, 67, 50, TO_DATE('2026-05-03', 'YYYY-MM-DD'), 'approved');

COMMIT;


select * from request;


-- 2024 Allocations
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (1, 15, 50, TO_DATE('2024-12-05', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (2, 22, 100, TO_DATE('2024-08-20', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (3, 40, 20, TO_DATE('2024-03-16', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (5, 5, 10, TO_DATE('2024-04-12', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (6, 12, 15, TO_DATE('2024-07-04', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (7, 65, 40, TO_DATE('2024-10-17', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (8, 72, 200, TO_DATE('2024-11-12', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (10, 80, 10, TO_DATE('2024-02-27', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (11, 84, 25, TO_DATE('2024-09-14', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (13, 90, 30, TO_DATE('2024-01-22', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (14, 18, 100, TO_DATE('2024-05-26', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (15, 33, 15, TO_DATE('2024-03-07', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (16, 45, 8, TO_DATE('2024-08-07', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (18, 55, 50, TO_DATE('2024-07-20', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (19, 61, 25, TO_DATE('2024-12-17', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (20, 10, 10, TO_DATE('2024-02-13', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (21, 28, 100, TO_DATE('2024-11-22', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (22, 39, 15, TO_DATE('2024-08-12', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (24, 77, 40, TO_DATE('2024-04-17', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (25, 92, 60, TO_DATE('2024-03-30', 'YYYY-MM-DD'));

-- 2025 Allocations
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (26, 14, 20, TO_DATE('2025-01-14', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (27, 26, 50, TO_DATE('2025-08-17', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (28, 38, 10, TO_DATE('2025-11-12', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (29, 44, 30, TO_DATE('2025-04-27', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (31, 60, 25, TO_DATE('2025-07-12', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (32, 70, 100, TO_DATE('2025-12-07', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (33, 85, 5, TO_DATE('2025-09-17', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (35, 100, 10, TO_DATE('2025-11-01', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (36, 12, 30, TO_DATE('2025-03-02', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (37, 24, 20, TO_DATE('2025-11-22', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (38, 36, 10, TO_DATE('2025-07-07', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (40, 52, 50, TO_DATE('2025-06-14', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (41, 68, 25, TO_DATE('2025-03-24', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (42, 82, 5, TO_DATE('2025-05-27', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (43, 98, 100, TO_DATE('2025-11-17', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (45, 11, 15, TO_DATE('2025-01-20', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (46, 23, 50, TO_DATE('2025-05-22', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (47, 35, 30, TO_DATE('2025-12-12', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (48, 47, 5, TO_DATE('2025-08-16', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (50, 71, 25, TO_DATE('2025-08-10', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (51, 83, 40, TO_DATE('2025-08-11', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (52, 95, 100, TO_DATE('2025-07-31', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (53, 5, 15, TO_DATE('2025-08-17', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (55, 30, 20, TO_DATE('2025-05-23', 'YYYY-MM-DD'));

-- 2026 Allocations (Recent)
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (56, 42, 50, TO_DATE('2026-02-17', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (57, 54, 200, TO_DATE('2026-01-12', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (58, 66, 30, TO_DATE('2026-03-07', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (60, 90, 25, TO_DATE('2026-03-02', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (61, 102, 100, TO_DATE('2026-04-22', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (62, 1, 15, TO_DATE('2026-05-03', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (63, 13, 5, TO_DATE('2026-03-17', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (65, 37, 10, TO_DATE('2026-01-22', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (66, 49, 50, TO_DATE('2026-03-12', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (67, 61, 20, TO_DATE('2026-02-07', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (68, 73, 30, TO_DATE('2026-04-30', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (70, 97, 100, TO_DATE('2026-03-24', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (71, 2, 5, TO_DATE('2026-04-12', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (72, 14, 25, TO_DATE('2026-02-16', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (73, 26, 10, TO_DATE('2026-05-04', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (75, 50, 40, TO_DATE('2026-04-17', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (76, 62, 15, TO_DATE('2026-03-20', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (77, 74, 100, TO_DATE('2026-04-27', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (78, 86, 20, TO_DATE('2026-02-22', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (80, 10, 30, TO_DATE('2026-05-03', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (81, 22, 10, TO_DATE('2026-02-18', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (82, 34, 50, TO_DATE('2026-01-13', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (83, 46, 15, TO_DATE('2026-03-08', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (85, 70, 100, TO_DATE('2026-03-03', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (86, 82, 5, TO_DATE('2026-04-23', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (87, 94, 40, TO_DATE('2026-05-04', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (89, 13, 30, TO_DATE('2026-04-08', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (90, 25, 15, TO_DATE('2026-01-23', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (91, 37, 50, TO_DATE('2026-03-13', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (92, 49, 100, TO_DATE('2026-02-08', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (94, 73, 25, TO_DATE('2026-01-18', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (95, 85, 40, TO_DATE('2026-03-25', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (97, 4, 30, TO_DATE('2026-02-17', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (98, 16, 50, TO_DATE('2026-05-05', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (99, 28, 15, TO_DATE('2026-01-08', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (100, 40, 100, TO_DATE('2026-04-18', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (102, 64, 40, TO_DATE('2026-04-28', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (103, 76, 10, TO_DATE('2026-02-23', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (105, 100, 50, TO_DATE('2026-05-04', 'YYYY-MM-DD'));

-- Multi-Center fulfillments (A single large request fulfilled from two different centers)
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (8, 73, 100, TO_DATE('2024-11-13', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (14, 19, 100, TO_DATE('2024-05-27', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (21, 29, 100, TO_DATE('2024-11-23', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (32, 71, 100, TO_DATE('2025-12-08', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (43, 99, 100, TO_DATE('2025-11-18', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (52, 96, 100, TO_DATE('2025-08-01', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (57, 55, 100, TO_DATE('2026-01-13', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (70, 98, 100, TO_DATE('2026-03-25', 'YYYY-MM-DD'));
INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date) VALUES (77, 75, 100, TO_DATE('2026-04-28', 'YYYY-MM-DD'));

COMMIT;


select * from resource_allocation;


-- Query1: Listing  all active disasters
SELECT * FROM Disaster WHERE status = 'active';



-- Query 2: Listing all available volunteers
SELECT v.volunteer_id, u.full_name, v.skill, v.availability
FROM Volunteer v
JOIN Users u ON v.user_id = u.user_id
WHERE v.availability = 'available';




-- Query 3: List all pending requests
SELECT r.request_id, u.full_name, d.disaster_name, res.resource_name, r.quantity, r.status
FROM Request r
JOIN Users u ON r.user_id = u.user_id
JOIN Disaster d ON r.disaster_id = d.disaster_id
JOIN Resources res ON r.resource_id = res.resource_id
WHERE r.status = 'pending';


-- Query 4: Show all relief centers and their capacities
SELECT center_name, location, capacity
FROM Relief_Center
ORDER BY capacity DESC;


--Query 5: Showing resource stock details with resource and center names
SELECT rs.stock_id, res.resource_name, res.category, rc.center_name, rs.quantity, rs.last_updated
FROM Resource_Stock rs
JOIN Resources res ON rs.resource_id = res.resource_id
JOIN Relief_Center rc ON rs.center_id = rc.center_id;




-- Query 6: Show volunteer assignments with volunteer name and center
SELECT va.assignment_id, u.full_name, v.skill, rc.center_name, va.assigned_date, va.status
FROM Volunteer_Assignment va
JOIN Volunteer v ON va.volunteer_id = v.volunteer_id
JOIN Users u ON v.user_id = u.user_id
JOIN Relief_Center rc ON va.center_id = rc.center_id;




-- Query 7: Show all allocations with request and center details
SELECT ra.allocation_id, u.full_name, res.resource_name, rc.center_name, ra.quantity, ra.allocated_date
FROM Resource_Allocation ra
JOIN Request r ON ra.request_id = r.request_id
JOIN Users u ON r.user_id = u.user_id
JOIN Resources res ON r.resource_id = res.resource_id
JOIN Relief_Center rc ON ra.center_id = rc.center_id;



-- Query 8: Full request details (5 table join)
SELECT r.request_id, u.full_name, d.disaster_name, d.location,
       res.resource_name, res.category, r.quantity, r.request_date, r.status
FROM Request r
JOIN Users u ON r.user_id = u.user_id
JOIN Disaster d ON r.disaster_id = d.disaster_id
JOIN Resources res ON r.resource_id = res.resource_id
ORDER BY r.request_date DESC;


-- Query 9: Total resources per category
SELECT res.category, SUM(rs.quantity) AS total_quantity
FROM Resource_Stock rs
JOIN Resources res ON rs.resource_id = res.resource_id
GROUP BY res.category
ORDER BY total_quantity DESC;


-- Query 10: Number of requests per disaster
SELECT d.disaster_name, COUNT(r.request_id) AS total_requests,
       SUM(r.quantity) AS total_quantity_requested
FROM Request r
JOIN Disaster d ON r.disaster_id = d.disaster_id
GROUP BY d.disaster_name
ORDER BY total_requests DESC;


SELECT d.disaster_name, COUNT(DISTINCT u.user_id) AS total_victims
FROM Disaster d
JOIN Request r ON d.disaster_id = r.disaster_id
JOIN Users u ON r.user_id = u.user_id
WHERE u.role = 'victim'
GROUP BY d.disaster_name;




-- Query 11: Number of volunteers per relief center
SELECT rc.center_name, COUNT(va.volunteer_id) AS total_volunteers
FROM Volunteer_Assignment va
JOIN Relief_Center rc ON va.center_id = rc.center_id
WHERE va.status = 'active'
GROUP BY rc.center_name
ORDER BY total_volunteers DESC;


-- Query 12: Average stock quantity per center
SELECT rc.center_name, ROUND(AVG(rs.quantity), 2) AS avg_stock
FROM Resource_Stock rs
JOIN Relief_Center rc ON rs.center_id = rc.center_id
GROUP BY rc.center_name
ORDER BY avg_stock DESC;



-- Q13: Total allocated quantity per resource
SELECT res.resource_name, SUM(ra.quantity) AS total_allocated
FROM Resource_Allocation ra
JOIN Request r ON ra.request_id = r.request_id
JOIN Resources res ON r.resource_id = res.resource_id
GROUP BY res.resource_name
ORDER BY total_allocated DESC;


-- Query 14: Count of requests by status
SELECT status, COUNT(*) AS total
FROM Request
GROUP BY status;



-- Query 15: Centers with stock quantity greater than 200
SELECT rc.center_name, res.resource_name, rs.quantity
FROM Resource_Stock rs
JOIN Relief_Center rc ON rs.center_id = rc.center_id
JOIN Resources res ON rs.resource_id = res.resource_id
WHERE rs.quantity > 200
ORDER BY rs.quantity DESC;





SET SERVEROUTPUT ON;


-- PROCEDURE 1: Approve a resource request
CREATE OR REPLACE PROCEDURE approve_request (
    p_request_id  IN NUMBER,
    p_center_id   IN NUMBER,
    p_quantity    IN NUMBER
) IS
    v_status VARCHAR2(20);
BEGIN
    SELECT status INTO v_status
    FROM Request
    WHERE request_id = p_request_id;

    IF v_status = 'pending' THEN
        UPDATE Request
        SET status = 'approved'
        WHERE request_id = p_request_id;

        INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date)
        VALUES (p_request_id, p_center_id, p_quantity, SYSDATE);

        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Request ' || p_request_id || ' approved successfully.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Request ' || p_request_id || ' is already ' || v_status || '. Cannot approve.');
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: Request ID ' || p_request_id || ' not found.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END approve_request;
/




-- Q3: List all pending requests
SELECT r.request_id, u.full_name, d.disaster_name, res.resource_name, r.quantity, r.status
FROM Request r
JOIN Users u ON r.user_id = u.user_id
JOIN Disaster d ON r.disaster_id = d.disaster_id
JOIN Resources res ON r.resource_id = res.resource_id
WHERE r.status = 'pending';







-- CURSOR 1: Display all pending requests with details
SET SERVEROUTPUT ON;
DECLARE
    CURSOR c_pending IS
        SELECT r.request_id, u.full_name, d.disaster_name,
               res.resource_name, r.quantity, r.request_date
        FROM Request r
        JOIN Users u ON r.user_id = u.user_id
        JOIN Disaster d ON r.disaster_id = d.disaster_id
        JOIN Resources res ON r.resource_id = res.resource_id
        WHERE r.status = 'pending';

    v_req     c_pending%ROWTYPE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('===== PENDING REQUESTS =====');
    OPEN c_pending;
    LOOP
        FETCH c_pending INTO v_req;
        EXIT WHEN c_pending%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(
            'Request #' || v_req.request_id ||
            ' | User: ' || v_req.full_name ||
            ' | Disaster: ' || v_req.disaster_name ||
            ' | Resource: ' || v_req.resource_name ||
            ' | Qty: ' || v_req.quantity
        );
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('----------------------------');
    DBMS_OUTPUT.PUT_LINE('Total pending: ' || c_pending%ROWCOUNT);
    
    CLOSE c_pending;
END;
/



-- FUNCTION 2: Get total number of victims for a disaster
CREATE OR REPLACE FUNCTION get_victim_count (
    p_disaster_id IN NUMBER
) RETURN NUMBER IS
    v_count NUMBER;
BEGIN
    SELECT COUNT(DISTINCT user_id) INTO v_count
    FROM Request
    WHERE disaster_id = p_disaster_id;

    RETURN v_count;

EXCEPTION
    WHEN OTHERS THEN
        RETURN 0;
END get_victim_count;
/

SET SERVEROUTPUT ON;
DECLARE
    v_total NUMBER;
BEGIN
    v_total := get_victim_count(47); 
    DBMS_OUTPUT.PUT_LINE('Total victim count: ' || v_total);
END;
/







CREATE OR REPLACE FUNCTION get_total_resource_quantity(
    p_resource_id IN Resources.resource_id%TYPE
)
RETURN NUMBER
IS
    v_total_quantity NUMBER := 0;  -- Accumulator variable
    v_resource_name  VARCHAR2(100);
BEGIN
    -- Validate that the resource exists
    SELECT resource_name
    INTO   v_resource_name
    FROM   Resources
    WHERE  resource_id = p_resource_id;
 
    -- Aggregate total quantity from all centers
    SELECT NVL(SUM(quantity), 0)
    INTO   v_total_quantity
    FROM   Resource_Stock
    WHERE  resource_id = p_resource_id;
 
    DBMS_OUTPUT.PUT_LINE('Resource: ' || v_resource_name ||
                         ' | Total Available: ' || v_total_quantity);
    RETURN v_total_quantity;
 
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('ERROR: resource_id ' ||
                              p_resource_id || ' does not exist.');
        RETURN -1;
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('UNEXPECTED ERROR: ' || SQLERRM);
        RETURN -1;
END get_total_resource_quantity;
/
 
-- ============================================================
-- EXECUTION BLOCK
-- ============================================================
SET SERVEROUTPUT ON;
 
DECLARE
    v_result NUMBER;
BEGIN
    -- Check total stock of resource_id = 1 (Rice)
    v_result := get_total_resource_quantity(1);
    DBMS_OUTPUT.PUT_LINE('Return value: ' || v_result);
 
    -- Check total stock of resource_id = 6 (Bottled Water 1L)
    v_result := get_total_resource_quantity(6);
    DBMS_OUTPUT.PUT_LINE('Return value: ' || v_result);
 
    -- Test with invalid resource_id
    v_result := get_total_resource_quantity(9999);
END;
/



-- FUNCTION 2: Get total number of victims for a disaster
CREATE OR REPLACE FUNCTION get_victim_count (
    p_disaster_id IN NUMBER
) RETURN NUMBER IS
    v_count NUMBER;
BEGIN
    SELECT COUNT(DISTINCT user_id) INTO v_count
    FROM Request
    WHERE disaster_id = p_disaster_id;

    RETURN v_count;

EXCEPTION
    WHEN OTHERS THEN
        RETURN 0;
END get_victim_count;
/

VARIABLE result NUMBER;
EXEC :result := get_victim_count(45);
PRINT result;



SELECT 
    d.disaster_name, 
    COUNT(DISTINCT r.user_id) AS victim_count
FROM Disaster d
LEFT JOIN Request r ON d.disaster_id = r.disaster_id
GROUP BY d.disaster_name
ORDER BY victim_count DESC;












CREATE OR REPLACE FUNCTION get_count_by_name (
    p_disaster_name IN VARCHAR2
) RETURN NUMBER IS
    v_count NUMBER;
BEGIN
    SELECT COUNT(DISTINCT r.user_id) INTO v_count
    FROM Request r
    JOIN Disaster d ON r.disaster_id = d.disaster_id
    WHERE UPPER(d.disaster_name) = UPPER(p_disaster_name);

    RETURN v_count;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 0;
    WHEN OTHERS THEN
        RETURN -1; -- Indicates an error
END;
/


SELECT get_count_by_name('Yamuna Overflow') AS victim_total FROM dual;



-- CURSOR 2: Display stock levels for all centers
SET SERVEROUTPUT ON;
DECLARE
    CURSOR c_stock IS
        SELECT rc.center_name, res.resource_name, rs.quantity
        FROM Resource_Stock rs
        JOIN Relief_Center rc ON rs.center_id = rc.center_id
        JOIN Resources res ON rs.resource_id = res.resource_id
        ORDER BY rc.center_name;

    v_center   VARCHAR2(100);
    v_resource VARCHAR2(100);
    v_qty      NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('===== RESOURCE STOCK REPORT =====');
    OPEN c_stock;
    LOOP
        FETCH c_stock INTO v_center, v_resource, v_qty;
        EXIT WHEN c_stock%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(
            'Center: ' || v_center ||
            ' | Resource: ' || v_resource ||
            ' | Stock: ' || v_qty
        );
    END LOOP;
    CLOSE c_stock;
END;
/



-- PROCEDURE 1: Approve a resource request
CREATE OR REPLACE PROCEDURE approve_request (
    p_request_id  IN NUMBER,
    p_center_id   IN NUMBER,
    p_quantity    IN NUMBER
) IS
    v_status VARCHAR2(20);
BEGIN
    SELECT status INTO v_status
    FROM Request
    WHERE request_id = p_request_id;

    IF v_status = 'pending' THEN
        UPDATE Request
        SET status = 'approved'
        WHERE request_id = p_request_id;

        INSERT INTO Resource_Allocation (request_id, center_id, quantity, allocated_date)
        VALUES (p_request_id, p_center_id, p_quantity, SYSDATE);

        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Request ' || p_request_id || ' approved successfully.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Request ' || p_request_id || ' is already ' || v_status || '. Cannot approve.');
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: Request ID ' || p_request_id || ' not found.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END approve_request;
/
SET SERVEROUTPUT ON;
BEGIN
    -- Parameters: (request_id, center_id, quantity)
    approve_request(12, 5, 20); 
END;
/

-- PROCEDURE 2: Update volunteer availability
CREATE OR REPLACE PROCEDURE update_volunteer_status (
    p_volunteer_id  IN NUMBER,
    p_status        IN VARCHAR2
) IS
    v_name VARCHAR2(100);
BEGIN
    SELECT u.full_name INTO v_name
    FROM Volunteer v
    JOIN Users u ON v.user_id = u.user_id
    WHERE v.volunteer_id = p_volunteer_id;

    UPDATE Volunteer
    SET availability = p_status
    WHERE volunteer_id = p_volunteer_id;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Volunteer ' || v_name || ' status updated to: ' || p_status);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: Volunteer ID ' || p_volunteer_id || ' not found.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END update_volunteer_status;
/

-- TRIGGER 1: Prevent over-allocation (Corrected to avoid NO_DATA_FOUND crashes)
CREATE OR REPLACE TRIGGER trg_check_stock
BEFORE INSERT ON Resource_Allocation
FOR EACH ROW
DECLARE
    v_available NUMBER;
    v_resource_id NUMBER;
BEGIN
    -- Get resource_id from the request
    SELECT resource_id INTO v_resource_id
    FROM Request
    WHERE request_id = :NEW.request_id;

    -- Safely check available stock at that center
    BEGIN
        SELECT quantity INTO v_available
        FROM Resource_Stock
        WHERE center_id = :NEW.center_id
        AND resource_id = v_resource_id;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            v_available := 0; -- If the center doesn't have it, stock is 0
    END;

    -- Block if not enough stock
    IF :NEW.quantity > v_available THEN
        RAISE_APPLICATION_ERROR(-20001, 
            'Insufficient stock. Available: ' || v_available || 
            ', Requested: ' || :NEW.quantity);
    END IF;
END;
/


-- TRIGGER 2: Auto reduce stock after allocation
CREATE OR REPLACE TRIGGER trg_reduce_stock
AFTER INSERT ON Resource_Allocation
FOR EACH ROW
DECLARE
    v_resource_id NUMBER;
BEGIN
    SELECT resource_id INTO v_resource_id
    FROM Request
    WHERE request_id = :NEW.request_id;

    UPDATE Resource_Stock
    SET quantity = quantity - :NEW.quantity,
        last_updated = SYSDATE
    WHERE center_id = :NEW.center_id
    AND resource_id = v_resource_id;

    DBMS_OUTPUT.PUT_LINE('Stock reduced by ' || :NEW.quantity || ' units.');
END;
/


-- TRIGGER 3: Log every new disaster into a log table
-- First create the log table
CREATE TABLE Disaster_Log (
    log_id       NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    disaster_id  NUMBER,
    disaster_name VARCHAR2(100),
    action       VARCHAR2(50),
    action_time  DATE DEFAULT SYSDATE
);

-- Now create the trigger
CREATE OR REPLACE TRIGGER trg_disaster_log
AFTER INSERT ON Disaster
FOR EACH ROW
BEGIN
    INSERT INTO Disaster_Log (disaster_id, disaster_name, action, action_time)
    VALUES (:NEW.disaster_id, :NEW.disaster_name, 'INSERTED', SYSDATE);
END;
/
















