import requests
import os
import base64
from io import BytesIO

r = requests.get('http://localhost:5000/')
print(r.status_code)
print(r.text)
r = requests.get('http://localhost:5000/data_to')
print(r.status_code)
print(r.text)

# Тестирование /apinet
path = os.path.join('./static', 'image0008.png')  # убедитесь, что файл существует
if os.path.exists(path):
    with open(path, 'rb') as fh:
        img_data = fh.read()
        b64 = base64.b64encode(img_data)
    jsondata = {'imagebin': b64.decode('utf-8')}
    res = requests.post('http://localhost:5000/apinet', json=jsondata)
    print('=== /apinet ===')
    print(res.status_code)
    if res.ok:
        print(res.json())
else:
    print('=== /apinet ===')
    print('File image0008.png not found in static/')

# Тестирование /apixml
try:
    r = requests.get('http://localhost:5000/apixml')
    print('=== /apixml ===')
    print(r.status_code)
    if r.status_code != 200:
        print('Error: status', r.status_code)
    else:
        print(r.text[:200] + '...')  # первые 200 символов
except Exception as e:
    print('Error:', e)

