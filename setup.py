# -*- coding: utf-8 -*-
import sys
from distutils.core import setup

# заглушка, если distutils не поддеерживает команду test
if __name__ == '__main__' and sys.argv[1] == 'test':
    exit()

with open('README.md') as readme:
    long_description = readme.read()

setup(
    name='sentry-server',
    version='',
    author='Valery Sukhomlinov',
    author_email='good-guy@good-guy.me',
    packages=[],
    license='BSD',
    description='Sentry server',
    long_description=long_description,
    classifiers=[
        'Environment :: Web Environment',
        'Framework :: Django',
    ],
)


