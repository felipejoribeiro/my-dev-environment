#!/usr/bin/env python3
'''
This program is used to sync all repos in the csv file.
'''

import csv
import os

MY_WD = "work"
if __name__ == "__main__":
    with open("git_repos.csv") as file:
        csv_data = csv.reader(file, delimiter=',')
        for row in csv_data:
            remote_path = row[1]
            local_path = row[0].split("/")[1]
            if os.path.exists('%s/%s' % (MY_WD, local_path)):
                print('Already exists: %s' % local_path)
            else:
                print('Cloning repository...')
                command = 'git clone %s %s/%s' % (remote_path,
                                                  MY_WD,
                                                  local_path)
                print(command)
                os.system(command)
