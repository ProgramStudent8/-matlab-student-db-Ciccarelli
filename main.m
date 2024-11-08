% Create the StudentDatabase class
db = StudentDatabase();  

% Initialize the database with a size of 10
db = db.init(10); 

% Create and add sample students with a name, age, GPA, and major
sample_students = {
    {"S001", "Alice", "Smith", 20, 3.5, "Computer Science"},
    {"S002", "Bob", "Book", 21, 3.6, "Mathematics"},
    {"S003", "Charlie", "Guy", 19, 3.2, "Physics"},
    {"S004", "Daisy", "Rose", 22, 3.8, "Chemistry"},
    {"S005", "Eve", "Johnson", 20, 3.9, "Biology"},
    {"S006", "Frank", "Woods", 23, 2.8, "History"},
    {"S007", "Grace", "Sorensen", 21, 3.1, "Literature"},
    {"S008", "Hannah", "Martin", 20, 3.3, "Economics"},
    {"S009", "Isaac", "Laney", 22, 3.4, "Philosophy"},
    {"S010", "Jack", "Ruppert", 19, 3.7, "Engineering"}
};

% Loop through sample students and add them to the database
for i = 1:length(sample_students)
    student_data = sample_students{i};  % Get the student data
    student = Student(student_data{:});  % Create Student object with sample data
    db = db.addStudent(student);  % Add student to the database
end 

% Show all of the students in the database
db.showStudents();

% Save the database to a file (.mat file)
file_name = 'student_database.mat';
db.saveToFile(file_name);

% Load the database from the file
db = db.loadFromFile(file_name);

% Show all students after loading from file
db.showStudents();

% Extract GPAs and ages for visualization portions of project 
gpas = [db.studentList.gpa];  % Extract GPAs
ages = [db.studentList.age];   % Extract ages
majors = {db.studentList.major};  % Collect majors as a cell array of strings

% Ensure majors is a cell array of character vectors (the strings from above)
majors = cellstr(majors);  % This converts the list of majors into the correct format

% 1. GPA Distribution Histogram
figure;
histogram(gpas, 'BinMethod', 'integers');
title('GPA Distribution Histogram');
xlabel('GPA');
ylabel('Number of Students');

% 2. Average GPA by Major
uniqueMajors = unique(majors);  % Get unique majors
averageGPA = zeros(size(uniqueMajors));

% Calculate average GPA for each major
for i = 1:length(uniqueMajors)
    majorGPA = gpas(strcmp(majors, uniqueMajors{i}));  % Extract GPAs for the specific major
    averageGPA(i) = mean(majorGPA);  % Calculate average GPA for each major
end

% Bar chart for Average GPA by Major
figure;
bar(averageGPA);
set(gca, 'XTickLabel', uniqueMajors);
title('Average GPA by Major');
xlabel('Major');
ylabel('Average GPA');

% 3. Age Distribution
figure;
histogram(ages, 'BinMethod', 'integers');
title('Age Distribution');
xlabel('Age');
ylabel('Number of Students');
