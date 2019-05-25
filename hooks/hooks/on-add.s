#!/usr/bin/env python

import sys
import re
import json
from datetime import timedelta as td, datetime as dt
 
DATE_FORMAT = '%Y%m%dT%H%M%SZ'
 
"""parse delta as +1d3h or +3m"""
def parse_time(time_str): 
    regex = re.compile(r'\+((?P<days>\d+?)d)?((?P<hours>\d+?)h)?((?P<minutes>\d+?)m)?((?P<seconds>\d+?)s)?')
    parts = regex.match(time_str).groupdict() 
    parts = {k: int(v) for k, v in parts.items() if v} 
    return td(**parts) 


added_task = json.loads(sys.stdin.readline())
if 'parent' in added_task and 'runtil' in added_task:
    delta = parse_time(added_task['runtil'])
    orig = dt.strptime(added_task['due'], DATE_FORMAT)
    added_task['until'] = dt.strftime(orig + delta, DATE_FORMAT)

print(json.dumps(added_task))
sys.exit(0)
