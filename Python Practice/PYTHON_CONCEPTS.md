# Python for Data Engineering — Concepts

## 1. Class
A class is a blueprint for objects.

```python
class Employee:
    def __init__(self, name, salary):
        self.name = name
        self.salary = salary
```

## 2. Object
An object is an instance of a class.

```python
e = Employee("Omkar", 80000)
print(e.name)
```

## 3. Attributes
Attributes are data stored on an object/class.

```python
class Employee:
    company = "DataCorp"        # class attribute
    def __init__(self, name):
        self.name = name         # instance attribute
```

`self.__salary` uses name-mangling and is the usual way to make an attribute harder to access accidentally.

## 4. Constructor
`__init__()` initializes a newly created object's state.

```python
class Employee:
    def __init__(self, name, salary):
        self.name = name
        self.salary = salary
```

Strictly speaking, `__new__()` creates the object and `__init__()` initializes it.

## 5. Destructor
`__del__()` is a finalizer hook, but its execution timing is not guaranteed. Do not use it for critical resource cleanup. Prefer context managers.

```python
class Demo:
    def __del__(self):
        print("cleanup hook")
```

## 6. Encapsulation
Encapsulation means keeping object state controlled behind a public interface.

```python
class Employee:
    def __init__(self, salary):
        self.__salary = salary

    @property
    def salary(self):
        return self.__salary

    @salary.setter
    def salary(self, value):
        if value < 0:
            raise ValueError("salary cannot be negative")
        self.__salary = value
```

## 7. Abstraction
Abstraction exposes what an object must do while hiding implementation details.

```python
from abc import ABC, abstractmethod

class DataSource(ABC):
    @abstractmethod
    def extract(self):
        pass

class CSVSource(DataSource):
    def extract(self):
        return "read CSV"
```

## 8. Inheritance
A child class reuses/extends a parent class.

```python
class Employee:
    def work(self):
        return "work"

class DataEngineer(Employee):
    def build_pipeline(self):
        return "ETL pipeline"
```

## 9. Polymorphism
Different objects can expose the same interface but implement different behavior.

```python
class CSVSource:
    def extract(self):
        return "CSV"

class APISource:
    def extract(self):
        return "API"

def run(source):
    return source.extract()

print(run(CSVSource()))
print(run(APISource()))
```

## 10. Composition
Composition means an object contains another object ("has-a").

```python
class Engine:
    def start(self):
        return "started"

class Pipeline:
    def __init__(self):
        self.engine = Engine()
```

For production code, composition is often more flexible than deep inheritance.

## 11. Instance / class / static methods

```python
class Employee:
    company = "DataCorp"

    def instance_method(self):
        return self.company

    @classmethod
    def class_method(cls):
        return cls.company

    @staticmethod
    def add(a, b):
        return a + b
```

## 12. Lambda
A lambda is a small anonymous function.

```python
square = lambda x: x*x
print(square(5))

employees = [{"name":"A","salary":50000}, {"name":"B","salary":80000}]
employees.sort(key=lambda e: e["salary"])
```

Use lambdas for short expressions; use `def` for reusable/complex logic.

## 13. Decorator
A decorator wraps a function/class to add behavior without changing its core code.

```python
from functools import wraps

def timer(fn):
    @wraps(fn)
    def wrapper(*args, **kwargs):
        import time
        start = time.perf_counter()
        result = fn(*args, **kwargs)
        print(time.perf_counter() - start)
        return result
    return wrapper

@timer
def process():
    return "done"
```

Data-engineering uses: logging, timing, retries, authorization, validation, caching.

## 14. Iterator
An iterator implements `__iter__()` and `__next__()`.

```python
class Counter:
    def __init__(self, n):
        self.n = n
        self.i = 0
    def __iter__(self):
        return self
    def __next__(self):
        if self.i >= self.n:
            raise StopIteration
        self.i += 1
        return self.i
```

## 15. Generator
A generator uses `yield` and produces values lazily.

```python
def read_rows(rows):
    for row in rows:
        yield row
```

This is especially useful for large ETL jobs.

## 16. List comprehension

```python
squares = [x*x for x in range(10) if x % 2 == 0]
```

## 17. Exception handling

```python
try:
    value = int(text)
except ValueError:
    value = None
finally:
    print("finished")
```

For ETL, combine exceptions with logging and retries.

## 18. Context manager

```python
with open("data.csv") as f:
    data = f.read()
```

It guarantees cleanup. Custom context managers can be created with `contextlib.contextmanager`.

## 19. Mutable vs immutable

Mutable: `list`, `dict`, `set`.

Immutable: `int`, `float`, `str`, `tuple` (when its contents are immutable).

This matters because assignment and copying can otherwise create unexpected shared state.

## 20. Shallow vs deep copy

```python
from copy import copy, deepcopy

b = copy(a)
c = deepcopy(a)
```

Shallow copy copies the outer object; deep copy recursively copies nested objects.

## 21. `*args` and `**kwargs`

```python
def f(*args, **kwargs):
    print(args)
    print(kwargs)
```

Useful when writing flexible utilities/decorators.

## 22. Type hints

```python
def total(values: list[float]) -> float:
    return sum(values)
```

They improve readability, tooling and maintainability.

## 23. Dataclass

```python
from dataclasses import dataclass

@dataclass
class Transaction:
    id: int
    amount: float
```

Useful for structured application/domain objects.

## 24. Logging

Prefer logging over `print()` in production ETL.

```python
import logging
logging.basicConfig(level=logging.INFO)
logging.info("ETL started")
```

## 25. Concurrency
Threads are generally useful for I/O-bound tasks; processes can help CPU-bound work. Standard CPython has the GIL, so threads do not generally provide parallel execution of Python bytecode for CPU-bound work.

## 26. Data-engineering essentials
You should be comfortable with:
- CSV, JSON, Excel, Parquet
- Pandas
- SQL/database connectivity
- REST APIs
- ETL/ELT
- logging and exception handling
- retries/backoff
- incremental loading/watermarks
- idempotency
- validation and data quality
- chunking/generators
- memory optimization
- unit testing
- configuration/environment variables
- Git
- basic Linux
- Spark/PySpark after core Python
