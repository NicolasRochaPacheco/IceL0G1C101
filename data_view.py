import csv

import matplotlib.pyplot as plt


clock = []
state = []
led = []

with open("output_data.csv") as _csv_file:
    _reader = csv.reader(_csv_file, delimiter=",")
    _lc = 0
    for row in _reader:
        if _lc == 0:
            _lc += 1
        else:
            clock.append(int(row[0]))
            state.append(int(row[1]))
            led.append(int(row[2]))

plt.plot(led)
plt.show()
