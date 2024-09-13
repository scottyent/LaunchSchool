# Check whether the keys 'name' and 'grade' exist in the following dictionary:

student = {
    'id': 123,
    'grade': 'B',
}

print(student.get('name', 'Name does not exist'))
print(student.get('grade', 'grade does not exist'))

print('name' in student)
print('grade' in student)