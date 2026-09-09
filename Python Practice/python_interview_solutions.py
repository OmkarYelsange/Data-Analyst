"""
PYTHON DATA ENGINEERING INTERVIEW PRACTICE
390 concise reference solutions.

Run individual functions/examples. The numbering follows the practice plan.
Datasets:
  employees.csv
  customers.csv
  transactions.csv
  orders.json
  employees.xlsx
"""

from collections import Counter, deque
from functools import reduce, wraps
from abc import ABC, abstractmethod
from dataclasses import dataclass
from copy import copy, deepcopy
from concurrent.futures import ThreadPoolExecutor, ProcessPoolExecutor
from contextlib import contextmanager
from pathlib import Path
import csv, json, math, re, time, logging, os
from datetime import datetime

# ============================================================
# 1-35 FUNDAMENTALS / LOOPS
# ============================================================

# 1
def even_odd(n): return "even" if n % 2 == 0 else "odd"

# 2
def largest3(a,b,c): return max(a,b,c)

# 3
def smallest3(a,b,c): return min(a,b,c)

# 4
def sign(n): return "positive" if n > 0 else "negative" if n < 0 else "zero"

# 5
def leap_year(y): return y % 400 == 0 or (y % 4 == 0 and y % 100 != 0)

# 6
def factorial(n):
    if n < 0: raise ValueError("negative factorial")
    result = 1
    for i in range(2,n+1): result *= i
    return result

# 7
def fibonacci(n):
    a,b=0,1; out=[]
    for _ in range(n): out.append(a); a,b=b,a+b
    return out

# 8
def is_prime(n):
    if n < 2: return False
    for i in range(2, math.isqrt(n)+1):
        if n%i == 0: return False
    return True

# 9
def primes_1_100(): return [n for n in range(2,101) if is_prime(n)]

# 10
def digit_sum(n): return sum(map(int,str(abs(n))))

# 11
def reverse_int(n): return int(str(n)[::-1]) if n >= 0 else -int(str(-n)[::-1])

# 12
def palindrome_number(n): return str(n) == str(n)[::-1]

# 13
def gcd(a,b): return math.gcd(a,b)

# 14
def lcm(a,b): return abs(a*b)//math.gcd(a,b) if a and b else 0

# 15
def digit_count(n): return len(str(abs(n)))

# 16
def second_largest(a):
    u=sorted(set(a), reverse=True); return u[1] if len(u)>1 else None

# 17
def duplicates(a): return [x for x,c in Counter(a).items() if c>1]

# 18
def unique_preserve(a):
    seen=set(); out=[]
    for x in a:
        if x not in seen: seen.add(x); out.append(x)
    return out

# 19
def frequencies(a): return dict(Counter(a))

# 20
def common(a,b): return list(set(a)&set(b))

# 21
def one_to_100(): return list(range(1,101))

# 22
def hundred_to_one(): return list(range(100,0,-1))

# 23
def multiplication_table(n): return [n*i for i in range(1,11)]

# 24
def sum_n(n): return n*(n+1)//2

# 25
def sum_even(n): return sum(range(2,n+1,2))

# 26
def sum_odd(n): return sum(range(1,n+1,2))

# 27
def pattern_stars(n): return "\n".join("*"*i for i in range(1,n+1))

# 28
def pattern_reverse_stars(n): return "\n".join("*"*i for i in range(n,0,-1))

# 29
def pattern_numbers(n): return "\n".join("".join(str(j) for j in range(1,i+1)) for i in range(1,n+1))

# 30
def pattern_repeated(n): return "\n".join(str(i)*i for i in range(1,n+1))

# 31
def armstrong(n):
    s=str(n); return sum(int(d)**len(s) for d in s)==n
def armstrongs(limit): return [n for n in range(1,limit+1) if armstrong(n)]

# 32
def perfect(n): return n>1 and sum(i for i in range(1,n) if n%i==0)==n
def perfect_numbers(limit): return [n for n in range(2,limit+1) if perfect(n)]

# 33
def first_n_primes(n):
    out=[]; x=2
    while len(out)<n:
        if is_prime(x): out.append(x)
        x+=1
    return out

# 34
def fibonacci_loop(n): return fibonacci(n)

# 35
def loop_iterations(n): return sum(range(n))

# ============================================================
# 36-55 STRINGS
# ============================================================

# 36
def reverse_string(s): return s[::-1]

# 37
def palindrome_string(s): return s == s[::-1]

# 38
def vowels_consonants(s):
    v=sum(c.lower() in "aeiou" for c in s if c.isalpha())
    return v, sum(c.isalpha() for c in s)-v

# 39
def char_frequency(s): return dict(Counter(s))

# 40
def first_nonrepeat(s):
    c=Counter(s)
    return next((x for x in s if c[x]==1), None)

# 41
def first_repeat(s):
    seen=set()
    for x in s:
        if x in seen: return x
        seen.add(x)
    return None

# 42
def remove_duplicate_chars(s): return "".join(unique_preserve(s))

# 43
def remove_spaces(s): return s.replace(" ","")

# 44
def word_count(s): return len(s.split())

# 45
def longest_word(s): return max(s.split(), key=len, default="")

# 46
def shortest_word(s): return min(s.split(), key=len, default="")

# 47
def capitalize_words(s): return s.title()

# 48
def reverse_each_word(s): return " ".join(w[::-1] for w in s.split())

# 49
def reverse_word_order(s): return " ".join(s.split()[::-1])

# 50
def anagram(a,b): return Counter(a.replace(" ","").lower())==Counter(b.replace(" ","").lower())

# 51
def duplicate_chars(s): return [c for c,n in Counter(s).items() if n>1]

# 52
def most_frequent_char(s): return Counter(s).most_common(1)[0][0] if s else None

# 53
def remove_special(s): return re.sub(r"[^A-Za-z0-9 ]","",s)

# 54
def extract_numbers(s): return "".join(re.findall(r"\d",s))

# 55
def extract_emails(s): return re.findall(r"[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}",s)

# ============================================================
# 56-80 LISTS / ARRAYS
# ============================================================

# 56
def max_list(a): return max(a)

# 57
def min_list(a): return min(a)

# 58
def second_largest2(a): return second_largest(a)

# 59
def second_smallest(a):
    u=sorted(set(a)); return u[1] if len(u)>1 else None

# 60
def reverse_list(a): return a[::-1]

# 61
def bubble_sort(a):
    a=a[:]
    for i in range(len(a)):
        for j in range(0,len(a)-i-1):
            if a[j]>a[j+1]: a[j],a[j+1]=a[j+1],a[j]
    return a

# 62
def duplicate_elements(a): return duplicates(a)

# 63
def remove_duplicates_order(a): return unique_preserve(a)

# 64
def repeated_more_than_once(a): return duplicates(a)

# 65
def missing_number(a):
    n=len(a)+1
    return n*(n+1)//2-sum(a)

# 66
def common_elements(a,b): return common(a,b)

# 67
def only_in_a(a,b): return list(set(a)-set(b))

# 68
def intersection(a,b): return list(set(a)&set(b))

# 69
def union(a,b): return list(set(a)|set(b))

# 70
def rotate_left(a,k): return a[k%len(a):]+a[:k%len(a)] if a else []

# 71
def rotate_right(a,k): return rotate_left(a,-k)

# 72
def zeros_end(a): return [x for x in a if x!=0]+[0]*a.count(0)

# 73
def two_sum(a,target):
    seen={}
    for i,x in enumerate(a):
        if target-x in seen: return seen[target-x],i
        seen[x]=i
    return None

# 74
def three_sum(a,target):
    a=sorted(a)
    for i in range(len(a)-2):
        l,r=i+1,len(a)-1
        while l<r:
            s=a[i]+a[l]+a[r]
            if s==target: return a[i],a[l],a[r]
            if s<target: l+=1
            else: r-=1
    return None

# 75
def max_subarray_sum(a):
    best=cur=a[0]
    for x in a[1:]: cur=max(x,cur+x); best=max(best,cur)
    return best

# 76
def element_frequency(a): return dict(Counter(a))

# 77
def flatten(lst):
    out=[]
    for x in lst:
        if isinstance(x,list): out.extend(flatten(x))
        else: out.append(x)
    return out

# 78
def common_three(a,b,c): return list(set(a)&set(b)&set(c))

# 79
def merge_sorted(a,b):
    i=j=0; out=[]
    while i<len(a) and j<len(b):
        if a[i]<=b[j]: out.append(a[i]); i+=1
        else: out.append(b[j]); j+=1
    return out+a[i:]+b[j:]

# 80
def kth_largest(a,k): return sorted(set(a),reverse=True)[k-1]

# ============================================================
# 81-100 DICTIONARIES
# ============================================================

# 81
def word_frequency(s): return dict(Counter(s.lower().split()))

# 82
def char_frequency_dict(s): return dict(Counter(s))

# 83
def max_value_key(d): return max(d,key=d.get)

# 84
def min_value_key(d): return min(d,key=d.get)

# 85
def sort_dict_value(d): return dict(sorted(d.items(),key=lambda x:x[1]))

# 86
def sort_dict_key(d): return dict(sorted(d.items()))

# 87
def merge_dicts(a,b): return {**a,**b}

# 88
def common_keys(a,b): return a.keys() & b.keys()

# 89
def only_keys_a(a,b): return a.keys()-b.keys()

# 90
def only_keys_b(a,b): return b.keys()-a.keys()

# 91
def invert_dict(d): return {v:k for k,v in d.items()}

# 92
def remove_none(d): return {k:v for k,v in d.items() if v is not None}

# 93
def duplicate_values(d): return [v for v,n in Counter(d.values()).items() if n>1]

# 94
def lists_to_dict(keys,values): return dict(zip(keys,values))

# 95
def group_employees(rows):
    out={}
    for r in rows: out.setdefault(r["department"],[]).append(r)
    return out

# 96
def highest_paid_by_dept(rows):
    return {d:max(rs,key=lambda r:r["salary"]) for d,rs in group_employees(rows).items()}

# 97
def avg_salary_by_dept(rows):
    g=group_employees(rows)
    return {d:sum(r["salary"] for r in rs)/len(rs) for d,rs in g.items()}

# 98
def employee_count_by_dept(rows): return {d:len(rs) for d,rs in group_employees(rows).items()}

# 99
def index_by_id(rows): return {r["employee_id"]:r for r in rows}

# 100
def flatten_dict(d,parent="",sep="."):
    out={}
    for k,v in d.items():
        key=f"{parent}{sep}{k}" if parent else str(k)
        if isinstance(v,dict): out.update(flatten_dict(v,key,sep))
        else: out[key]=v
    return out

# ============================================================
# 101-120 FUNCTIONS
# ============================================================

# 101-108 reuse functions above; example reusable salary statistics:
def salary_stats(rows):
    s=[r["salary"] for r in rows]
    return {"min":min(s),"max":max(s),"avg":sum(s)/len(s)}

# 109
def args_demo(*args): return sum(args)

# 110
def kwargs_demo(**kwargs): return kwargs

# 111
def positional(a,b): return a+b

# 112
def keyword(a,b): return a+b

# 113
def default_arg(a,b=10): return a+b

# 114
def keyword_only(a,*,b): return a+b

# 115
def typed_add(a:int,b:int)->int: return a+b

# 116
def min_max(a): return min(a),max(a)

# 117
def apply_func(fn,x): return fn(x)

# 118
def multiplier(n):
    def inner(x): return x*n
    return inner

# 119-120: place reusable functions in a module; import with `from utilities import ...`

# ============================================================
# 121-135 RECURSION
# ============================================================

# 121
def factorial_rec(n): return 1 if n<=1 else n*factorial_rec(n-1)

# 122
def fib_rec(n): return n if n<2 else fib_rec(n-1)+fib_rec(n-2)

# 123
def sum_rec(n): return 0 if n<=0 else n+sum_rec(n-1)

# 124
def reverse_rec(s): return s if len(s)<=1 else reverse_rec(s[1:])+s[0]

# 125
def power_rec(a,n): return 1 if n==0 else a*power_rec(a,n-1)

# 126
def gcd_rec(a,b): return abs(a) if b==0 else gcd_rec(b,a%b)

# 127
def count_digits_rec(n): return 1 if abs(n)<10 else 1+count_digits_rec(n//10)

# 128
def digit_sum_rec(n): return abs(n) if abs(n)<10 else abs(n)%10+digit_sum_rec(abs(n)//10)

# 129
def palindrome_rec(s): return len(s)<2 or (s[0]==s[-1] and palindrome_rec(s[1:-1]))

# 130
def max_rec(a): return a[0] if len(a)==1 else max(a[0],max_rec(a[1:]))

# 131
def flatten_rec(a): return flatten(a)

# 132
def hanoi(n,src,aux,dst,moves=None):
    moves=[] if moves is None else moves
    if n: hanoi(n-1,src,dst,aux,moves); moves.append((src,dst)); hanoi(n-1,aux,src,dst,moves)
    return moves

# 133
def binary_search_rec(a,target,lo=0,hi=None):
    hi=len(a)-1 if hi is None else hi
    if lo>hi: return -1
    m=(lo+hi)//2
    if a[m]==target:return m
    return binary_search_rec(a,target,lo,m-1) if target<a[m] else binary_search_rec(a,target,m+1,hi)

# 134
def tree_inorder(root):
    if not root:return []
    return tree_inorder(root.left)+[root.value]+tree_inorder(root.right)

# 135: recursion depth is limited; use iteration/generators for large workloads.

# ============================================================
# 136-150 FUNCTIONAL PYTHON
# ============================================================

# 136
def squares(a): return list(map(lambda x:x*x,a))

# 137
def evens(a): return list(filter(lambda x:x%2==0,a))

# 138
def prime_filter(a): return list(filter(is_prime,a))

# 139
def upper_list(a): return list(map(str.upper,a))

# 140
def reduce_max(a): return reduce(lambda x,y:max(x,y),a)

# 141
def reduce_product(a): return reduce(lambda x,y:x*y,a,1)

# 142
def sort_salary(rows): return sorted(rows,key=lambda r:r["salary"])

# 143
def sort_age(rows): return sorted(rows,key=lambda r:r["age"])

# 144
def sort_dept_salary(rows): return sorted(rows,key=lambda r:(r["department"],r["salary"]))

# 145
def extract_field(rows,field): return [r.get(field) for r in rows]

# 146
def total_amount(rows): return sum(r["amount"] for r in rows)

# 147
def avg_amount(rows): return total_amount(rows)/len(rows) if rows else 0

# 148
def large_transactions(rows,limit=10000): return [r for r in rows if r["amount"]>limit]

# 149
def comprehension_demo(a): return [x*x for x in a if x%2==0]

# 150: rewrite loops with list/dict comprehensions where readability improves.

# ============================================================
# 151-165 EXCEPTIONS
# ============================================================

# 151
def safe_divide(a,b):
    try:return a/b
    except ZeroDivisionError:return None

# 152
def safe_int(s):
    try:return int(s)
    except ValueError:return None

# 153
def safe_get(d,k): return d.get(k)

# 154
def read_file_safe(path):
    try:return Path(path).read_text()
    except FileNotFoundError:return None

# 155
def parse_amount(x):
    try:return float(x)
    except (ValueError,TypeError): raise ValueError(f"Invalid amount: {x}")

# 156
class InvalidSalaryError(Exception): pass

# 157
def try_except_else_finally(x):
    try: y=10/x
    except ZeroDivisionError: return "error"
    else: return y
    finally: pass

# 158
def validate_salary(s):
    if s<0: raise InvalidSalaryError("salary cannot be negative")
    return True

# 159
class InvalidTransactionError(Exception): pass
def validate_transaction_amount(a):
    if a<=0: raise InvalidTransactionError("amount must be positive")

# 160
logging.basicConfig(level=logging.INFO)
logger=logging.getLogger("etl")

def logged_operation(fn):
    try:return fn()
    except Exception:
        logger.exception("operation failed")
        raise

# 161
def retry(fn,retries=3):
    for attempt in range(retries):
        try:return fn()
        except Exception:
            if attempt==retries-1: raise
            time.sleep(1)

# 162
def multi_exception(x):
    try:return int(x)/1
    except (ValueError,TypeError):return None

# 163 BaseException includes system-exiting exceptions; application errors normally inherit Exception.

# 164 finally runs whether an exception occurs (except abrupt process termination).

# 165 combine extraction, validation, transformation, load, logging and exceptions.

# ============================================================
# 166-190 OOP
# ============================================================

# 166-170
class Employee:
    company="DataCorp"                    # 175 class attribute
    def __init__(self,name,salary):       # 170 constructor
        self.name=name                    # 168 instance attribute
        self.__salary=salary              # 179 encapsulated attribute
    def get_salary(self): return self.__salary  # 169 method
    def __str__(self): return f"{self.name}: {self.__salary}"  # 172
    def __repr__(self): return f"Employee({self.name!r},{self.__salary!r})" # 173
    def __del__(self): pass               # 174 destructor; timing is not guaranteed

# 176 instance attributes are stored per object; class attributes are shared unless overridden.

# 177
class EmployeeTools:
    @classmethod
    def company_name(cls): return cls.__name__
    @staticmethod
    def add(a,b): return a+b

# 178 static method has no self/cls automatically.

# 179 encapsulation: keep internal state behind methods/properties.
class Account:
    def __init__(self,balance): self.__balance=balance
    @property
    def balance(self): return self.__balance

# 180 inheritance
class Developer(Employee): pass

# 181 multilevel
class DataEngineer(Developer): pass

# 182 multiple inheritance
class LoggerMixin:
    def log(self,msg): return f"LOG: {msg}"
class LoggedEngineer(DataEngineer,LoggerMixin): pass

# 183 overriding
class Manager(Employee):
    def get_salary(self): return super().get_salary()*1.1

# 184 polymorphism
def show_salary(obj): return obj.get_salary()

# 185 abstraction
class AbstractEmployee(ABC):
    @abstractmethod
    def work(self): pass

# 186 abstract employee implemented:
class ConcreteEngineer(AbstractEmployee):
    def work(self): return "building pipelines"

# 187-188
class Developer2(AbstractEmployee):
    def work(self): return "writing software"
class Manager2(AbstractEmployee):
    def work(self): return "managing team"
class DataEngineer2(AbstractEmployee):
    def work(self): return "building ETL pipelines"

# 189 composition
class Engine:
    def start(self): return "engine started"
class Car:
    def __init__(self): self.engine=Engine()

# 190 composition often models "has-a"; inheritance models "is-a".

# ============================================================
# 191-195 ATTRIBUTES / PROPERTY
# ============================================================

class SecureEmployee:
    company="DataCorp"                    # class attribute
    def __init__(self,name,salary):
        self.name=name
        self.__salary=salary               # name-mangled private convention
    @property
    def salary(self):                      # 193 getter
        return self.__salary
    @salary.setter
    def salary(self,value):                # 194 validation
        if value<0: raise ValueError("salary must be >= 0")
        self.__salary=value

class ReadOnlyEmployee:
    def __init__(self,salary): self.__salary=salary
    @property
    def salary(self): return self.__salary # 195 no setter => read-only

# ============================================================
# 196-210 DECORATORS
# ============================================================

# 196
def simple_decorator(fn):
    @wraps(fn)
    def wrapper(*args,**kwargs):
        return fn(*args,**kwargs)
    return wrapper

# 197
def print_calls(fn):
    @wraps(fn)
    def wrapper(*args,**kwargs):
        print("calling",fn.__name__)
        return fn(*args,**kwargs)
    return wrapper

# 198 / 208
def timer(fn):
    @wraps(fn)
    def wrapper(*args,**kwargs):
        start=time.perf_counter()
        result=fn(*args,**kwargs)
        print(f"{fn.__name__}: {time.perf_counter()-start:.6f}s")
        return result
    return wrapper

# 199
def log_call(fn):
    @wraps(fn)
    def wrapper(*args,**kwargs):
        logger.info("running %s",fn.__name__)
        return fn(*args,**kwargs)
    return wrapper

# 200
def require_role(role):
    def deco(fn):
        @wraps(fn)
        def wrapper(user_role,*args,**kwargs):
            if user_role!=role: raise PermissionError("unauthorized")
            return fn(user_role,*args,**kwargs)
        return wrapper
    return deco

# 201 / 204
def retry_decorator(retries=3):
    def deco(fn):
        @wraps(fn)
        def wrapper(*args,**kwargs):
            for i in range(retries):
                try:return fn(*args,**kwargs)
                except Exception:
                    if i==retries-1: raise
        return wrapper
    return deco

# 202 multiple decorators: decorators stack bottom-up at definition time.
# 203 order: @a @b def f => a(b(f)).
# 205 caching:
from functools import lru_cache
@lru_cache(maxsize=128)
def cached_square(n): return n*n

# 206 functools.wraps preserves metadata.
# 207
def validate_nonnegative(fn):
    @wraps(fn)
    def wrapper(x,*args,**kwargs):
        if x<0: raise ValueError("negative")
        return fn(x,*args,**kwargs)
    return wrapper

# 209
def catch_log(fn):
    @wraps(fn)
    def wrapper(*args,**kwargs):
        try:return fn(*args,**kwargs)
        except Exception:
            logger.exception("error in %s",fn.__name__)
            raise
    return wrapper

# 210 decorators are useful for ETL logging, retry, timing, authorization and validation.

# ============================================================
# 211-225 ITERATORS / GENERATORS
# ============================================================

# 211-213
class CountIterator:
    def __init__(self,n): self.n=n; self.i=0
    def __iter__(self): return self
    def __next__(self):
        if self.i>=self.n: raise StopIteration
        self.i+=1
        return self.i

# 214
def number_generator(n):
    for i in range(n): yield i

# 215
def fibonacci_generator():
    a,b=0,1
    while True:
        yield a
        a,b=b,a+b

# 216
def prime_generator():
    n=2
    while True:
        if is_prime(n): yield n
        n+=1

# 217
def lines(path):
    with open(path,encoding="utf-8") as f:
        for line in f: yield line.rstrip("\n")

# 218
def transaction_generator(rows):
    for row in rows: yield row

# 219 list materializes all records; generator produces lazily and usually uses much less memory.

# 220 lazy evaluation means values are computed when requested, not all at once.

# 221-222
def pipeline(rows):
    for r in rows:
        if r["amount"]>10000:
            yield {"transaction_id":r["transaction_id"],"amount":r["amount"]}

# 223 use generators/chunking for 10M records rather than building one huge list.

# 224 generators fit streaming ETL pipelines.

# 225 yield pauses/resumes generator; return exits function.

# ============================================================
# 226-240 STACK / QUEUE
# ============================================================

class Stack:
    def __init__(self): self.items=[]
    def push(self,x): self.items.append(x)
    def pop(self): return self.items.pop()
    def peek(self): return self.items[-1] if self.items else None
    def empty(self): return not self.items

class Queue:
    def __init__(self): self.items=deque()
    def enqueue(self,x): self.items.append(x)
    def dequeue(self): return self.items.popleft()
    def empty(self): return not self.items

# 234 circular queue
class CircularQueue:
    def __init__(self,k): self.q=[None]*k; self.k=k; self.head=self.tail=self.size=0
    def enqueue(self,x):
        if self.size==self.k:return False
        self.q[self.tail]=x; self.tail=(self.tail+1)%self.k; self.size+=1; return True
    def dequeue(self):
        if not self.size:return None
        x=self.q[self.head]; self.head=(self.head+1)%self.k; self.size-=1; return x

# 235
import heapq
def priority_queue(items):
    h=[]
    for priority,item in items: heapq.heappush(h,(priority,item))
    return [heapq.heappop(h) for _ in range(len(h))]

# 236
def reverse_stack(s):
    return list(reversed(s))

# 237
def balanced(s):
    pairs={")":"(","]":"[","}":"{"}; st=[]
    for c in s:
        if c in "([{": st.append(c)
        elif c in pairs and (not st or st.pop()!=pairs[c]): return False
    return not st

# 238 browser history: use back/forward stacks.
# 239 task processing: queue preserves FIFO.
# 240 stack=LIFO; queue=FIFO.

# ============================================================
# 241-265 FILES
# ============================================================

# 241
def read_csv(path):
    with open(path,newline="",encoding="utf-8") as f:return list(csv.DictReader(f))

# 242
def write_csv(path,rows,fieldnames):
    with open(path,"w",newline="",encoding="utf-8") as f:
        w=csv.DictWriter(f,fieldnames=fieldnames); w.writeheader(); w.writerows(rows)

# 243
def append_csv(path,row,fieldnames):
    exists=Path(path).exists()
    with open(path,"a",newline="",encoding="utf-8") as f:
        w=csv.DictWriter(f,fieldnames=fieldnames)
        if not exists:w.writeheader()
        w.writerow(row)

# 244
def csv_count(path): return sum(1 for _ in open(path,encoding="utf-8"))-1

# 245
def malformed_csv(path,required_cols):
    rows=read_csv(path); return [r for r in rows if any(not r.get(c) for c in required_cols)]

# 246
def read_json(path):
    with open(path,encoding="utf-8") as f:return json.load(f)

# 247
def write_json(path,data):
    with open(path,"w",encoding="utf-8") as f:json.dump(data,f,indent=2)

# 248-249
def flatten_order(order):
    out=[]
    for item in order["items"]:
        out.append({"order_id":order["order_id"],"customer_id":order["customer_id"],
                    "order_date":order["order_date"],"shipping_city":order["shipping"]["city"],
                    **item})
    return out

# 250
def extract_order_fields(orders):
    return [{"order_id":o["order_id"],"customer_id":o["customer_id"],"status":o["status"]} for o in orders]

# 251
def stream_file(path):
    with open(path,encoding="utf-8") as f:
        for line in f: yield line

# 252
def read_in_chunks(path,chunk_size=1000):
    with open(path,encoding="utf-8") as f:
        while True:
            chunk=f.readlines(chunk_size)
            if not chunk:break
            yield chunk

# 253
def merge_csvs(paths,out):
    all_rows=[]
    for p in paths: all_rows.extend(read_csv(p))
    if all_rows: write_csv(out,all_rows,list(all_rows[0]))

# 254
def split_csv(rows,size):
    return [rows[i:i+size] for i in range(0,len(rows),size)]

# 255
def duplicate_records(rows,key): 
    c=Counter(r[key] for r in rows); return [r for r in rows if c[r[key]]>1]

# 256
def deduplicate_records(rows,key): 
    seen=set(); out=[]
    for r in rows:
        if r[key] not in seen: seen.add(r[key]); out.append(r)
    return out

# 257
def validate_columns(rows,required):
    if not rows:return False
    return set(required)<=set(rows[0])

# 258
def missing_values(rows):
    return {k:sum(v in (None,"") for v in (r.get(k) for r in rows)) for k in rows[0]}

# 259
def csv_to_json(csv_path,json_path): write_json(json_path,read_csv(csv_path))

# 260
def json_to_csv(json_path,csv_path): 
    rows=read_json(json_path); write_csv(csv_path,rows,list(rows[0]) if rows else [])

# 261/263
def csv_to_parquet(csv_path,parquet_path):
    import pandas as pd
    pd.read_csv(csv_path).to_parquet(parquet_path,index=False)

def read_parquet(path):
    import pandas as pd
    return pd.read_parquet(path)

# 262 read parquet = pd.read_parquet.
# 264 CSV is simple/interoperable; JSON is semi-structured; Parquet is columnar and efficient for analytics.
# 265 mini ETL: extract CSV -> validate -> transform -> parquet.

# ============================================================
# 266-300 PANDAS
# ============================================================

import pandas as pd

def pandas_practice():
    emp=pd.read_csv("employees.csv")
    tx=pd.read_csv("transactions.csv")

    # 266 load
    # 267
    print(emp.head(), emp.shape, emp.columns)
    # 268
    print(emp.dtypes)
    # 269
    print(emp.isna().sum())
    # 270
    emp["salary"]=emp["salary"].fillna(emp["salary"].median())
    # 271
    emp=emp.dropna()
    # 272
    emp=emp.drop_duplicates()
    # 273
    print(emp[emp.salary>100000])
    # 274
    print(emp.sort_values("salary",ascending=False))
    # 275-278
    print(emp.groupby("department")["salary"].mean())
    print(emp.groupby("department")["salary"].max())
    print(emp.groupby("department").size())
    # 279
    print(emp.nlargest(5,"salary"))
    # 280
    print(emp["salary"].drop_duplicates().nlargest(2).iloc[-1])
    # 281-286
    # Example join: emp.merge(other,on="employee_id",how="inner")
    # left/right/outer are the corresponding `how` values.
    # pd.concat([df1,df2])
    # 287
    emp["salary_lpa"]=emp.salary/100000
    # 288
    emp["name_length"]=emp.name.apply(len)
    # 289-291
    emp["join_date"]=pd.to_datetime(emp.join_date)
    emp["join_year"]=emp.join_date.dt.year
    emp["join_month"]=emp.join_date.dt.month
    # 292
    print(tx[tx.duplicated("transaction_id",False)])
    # 293
    tx["transaction_date"]=pd.to_datetime(tx.transaction_date)
    print(tx.groupby(tx.transaction_date.dt.date)["amount"].sum())
    # 294
    print(tx.groupby(tx.transaction_date.dt.to_period("M"))["amount"].sum())
    # 295
    print(tx.groupby("customer_id")["amount"].sum().nlargest(1))
    # 296
    # customers without transactions:
    customers=pd.read_csv("customers.csv")
    print(customers[~customers.customer_id.isin(tx.customer_id)])
    # 297
    print(tx[tx.amount>tx.amount.quantile(.99)])
    # 298
    def transform(df): return df.assign(amount_lakh=df.amount/100000)
    # 299
    print(emp.memory_usage(deep=True))
    # 300
    for chunk in pd.read_csv("transactions.csv",chunksize=10000):
        print(chunk.amount.sum())

# ============================================================
# 301-315 REGEX
# ============================================================

# 301
email_re=r"[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}"
# 302
phone_re=r"\b(?:\+91[- ]?)?[6-9]\d{9}\b"
# 303
def regex_numbers(s): return re.findall(r"\d+",s)
# 304
def regex_dates(s): return re.findall(r"\b\d{4}-\d{2}-\d{2}\b",s)
# 305
def valid_email(s): return bool(re.fullmatch(email_re,s))
# 306
def valid_indian_phone(s): return bool(re.fullmatch(phone_re,s))
# 307
def clean_special(s): return re.sub(r"[^A-Za-z0-9 ]","",s)
# 308
def alphanumeric(s): return re.findall(r"[A-Za-z0-9]+",s)
# 309
def normalize_spaces(s): return re.sub(r"\s+"," ",s).strip()
# 310
def url_domain(url): 
    m=re.search(r"https?://(?:www\.)?([^/]+)",url); return m.group(1) if m else None
# 311
def mask_phone(s): return re.sub(r"(\d{2})\d{6}(\d{2})",r"\1******\2",s)
# 312
def mask_email(s):
    m=re.match(r"([^@]+)@(.+)",s)
    return (m.group(1)[0]+"***@"+m.group(2)) if m else s
# 313
def hashtags(s): return re.findall(r"#\w+",s)
# 314
def clean_name(s): return normalize_spaces(re.sub(r"[^A-Za-z .'-]","",s)).title()
# 315 put regex transformations into a reusable module.

# ============================================================
# 316-340 ADVANCED PYTHON
# ============================================================

# 316
def shallow_deep_demo(obj): return copy(obj),deepcopy(obj)

# 317 immutable: int/float/str/tuple (if contents immutable); list/dict/set are mutable.
# 318 namespace = mapping from names to objects.
# 319 LEGB = Local, Enclosing, Global, Built-in.
# 320
x_global=10
def use_global():
    global x_global
    x_global+=1
# 321
def closure_counter():
    n=0
    def inc():
        nonlocal n; n+=1; return n
    return inc
# 322-324 closures/first-class/higher-order functions:
def make_power(n): return lambda x:x**n
# 325 higher-order function accepts/returns a function.
# 326 duck typing: behavior matters more than declared type.
# 327 dunder methods are special methods such as __init__, __len__, __getitem__.
# 328
class Collection:
    def __init__(self,a): self.a=a
    def __len__(self): return len(self.a)
    def __getitem__(self,i): return self.a[i]
    def __eq__(self,o): return self.a==o.a
# 329 __getitem__ enables indexing.
# 330 __eq__ custom equality.
# 331
class Number:
    def __init__(self,n): self.n=n
    def __lt__(self,o): return self.n<o.n
# 332
class Addable:
    def __init__(self,n): self.n=n
    def __add__(self,o): return Addable(self.n+o.n)
# 333 custom iterable: implement __iter__/__next__ or return an iterator from __iter__.
# 334
@dataclass
class Record:
    id:int
    value:str
# 335-336 type hints:
def typed_fn(rows:list[dict]) -> dict[str,int]: return {}
# 337 *args/**kwargs covered above.
# 338 context manager with `with`.
# 339
@contextmanager
def managed_file(path,mode="r"):
    f=open(path,mode,encoding="utf-8")
    try: yield f
    finally: f.close()
# 340 with managed_file(...) as f: ...

# ============================================================
# 341-355 CONCURRENCY
# ============================================================

def io_task(x): time.sleep(.01); return x*x
def cpu_task(x): return sum(i*i for i in range(x))

# 342-343
def threads(items):
    with ThreadPoolExecutor(max_workers=5) as ex:return list(ex.map(io_task,items))

# 347
def processes(items):
    with ProcessPoolExecutor(max_workers=4) as ex:return list(ex.map(cpu_task,items))

# 348 threading is useful mainly for I/O-bound work; multiprocessing for CPU-bound work.
# 349 GIL limits simultaneous execution of Python bytecode in standard CPython threads.
# 350 CPU-bound = computation; I/O-bound = waiting on files/network/db.
# 351 race condition = result depends on timing of concurrent operations.
# 352 use threading.Lock for shared mutable state.
# 353 concurrent file processing: ThreadPoolExecutor for I/O-heavy files.
# 354 benchmark with time.perf_counter().
# 355 choose concurrency based on workload and bottleneck; do not parallelize blindly.

# ============================================================
# 356-375 SQL + PYTHON
# ============================================================

# Requires: pip install mysql-connector-python pandas sqlalchemy
#
# import mysql.connector
# conn=mysql.connector.connect(host="localhost",user="root",password="...",database="practice_sql")
# cursor=conn.cursor()
# cursor.execute("SELECT * FROM employees WHERE salary > %s",(100000,))
# rows=cursor.fetchall()
# cursor.executemany("INSERT INTO t(a,b) VALUES(%s,%s)", data)
# conn.commit()
# conn.rollback()
# cursor.close(); conn.close()

# SQLAlchemy/Pandas:
# from sqlalchemy import create_engine
# engine=create_engine("mysql+mysqlconnector://root:password@localhost/practice_sql")
# df=pd.read_sql("SELECT * FROM employees",engine)
# df.to_sql("employees_copy",engine,if_exists="replace",index=False)

# 365 batch inserts: cursor.executemany(...)
# 366-367 transactions: commit/rollback.
# 368 wrap DB operations in try/except/finally.
# 369 create DatabaseClient class wrapping connection/cursor.
# 370 CSV -> validation -> transform -> MySQL.
# 371-375 extraction/transformation/loading/incremental loading follow the same pattern;
# incremental loads use a watermark such as updated_at or an increasing ID.

# ============================================================
# 376-390 API + ETL
# ============================================================

# Requires: pip install requests
#
# import requests
# r=requests.get("https://api.example.com/data",timeout=30)
# r.raise_for_status()
# data=r.json()

def fetch_json(url,params=None,retries=3):
    import requests
    for attempt in range(retries):
        try:
            r=requests.get(url,params=params,timeout=30)
            r.raise_for_status()
            return r.json()
        except requests.RequestException:
            if attempt==retries-1: raise
            time.sleep(2**attempt)

# 381 pagination pattern:
def paginate(fetch_page):
    page=1
    while True:
        data=fetch_page(page)
        rows=data.get("results",[])
        if not rows: break
        yield from rows
        page+=1

# 382 nested JSON: access dictionaries/lists or flatten with pandas.json_normalize.
# 383 pandas.json_normalize(data)
# 384 write_json(...)
# 385 json -> DataFrame -> to_csv(...)
# 386 DataFrame -> to_sql(...)
# 387 API -> validate -> transform -> load.
# 388 rate limits: respect Retry-After and use exponential backoff.
# 389 incremental API extraction: store last successful watermark/token.
# 390 production ETL should include configuration, retries, logging, validation,
#     idempotency, checkpoints/watermarks, monitoring and tests.

# ============================================================
# 391+ OPTIONAL DATA-ENGINEERING INTERVIEW CHALLENGES
# ============================================================

# Challenge A: Find top 3 customers by successful transaction amount.
def top_customers(rows,n=3):
    totals={}
    for r in rows:
        if r["status"]=="SUCCESS":
            totals[r["customer_id"]]=totals.get(r["customer_id"],0)+float(r["amount"])
    return sorted(totals.items(),key=lambda x:x[1],reverse=True)[:n]

# Challenge B: deduplicate by ID keeping latest timestamp.
def dedupe_latest(rows,id_col,ts_col):
    best={}
    for r in rows:
        k=r[id_col]
        if k not in best or r[ts_col]>best[k][ts_col]: best[k]=r
    return list(best.values())

# Challenge C: memory-efficient CSV transformation.
def stream_transform_csv(src,dst):
    with open(src,newline="",encoding="utf-8") as fin, open(dst,"w",newline="",encoding="utf-8") as fout:
        reader=csv.DictReader(fin)
        fields=reader.fieldnames+["amount_lakh"]
        writer=csv.DictWriter(fout,fieldnames=fields); writer.writeheader()
        for r in reader:
            r["amount_lakh"]=round(float(r["amount"])/100000,4)
            writer.writerow(r)

if __name__=="__main__":
    print("Practice bundle ready. Import individual functions and solve each question yourself first.")
