# Create new solutions of leetcode problems.
from typing import List, Dict, Tuple


class SolutionInfo:
    def __init__(self):
        self.num = 0
        self.num_str = ''
        self.link = ''

    def set_num(self, num: int):
        fill_zero_cnt = 0
        if num >= 1000:
            fill_zero_cnt = 0
        elif num >= 100:
            fill_zero_cnt = 1
        elif num >= 10:
            fill_zero_cnt = 2
        else:
            fill_zero_cnt = 3
        self.num = num
        self.num_str = 'p' + fill_zero_cnt * '0' + str(num)

    def set_link(self, link: str):
        self.link = link

    def gen_package_part1(self) -> str:
        return f'.executable(name: "{self.num_str}", targets: ["{self.num_str}"]),'

    def gen_package_part2(self) -> str:
        return f'''        .executableTarget(
            name: "{self.num_str}",
            dependencies: [
                "Utils",
                .product(name: "Collections", package: "swift-collections"),
            ],
            path: "Sources/{self.num_str}"
        ),'''

    def gen_file_content(self) -> str:
        return f'''
        '''


def read_info() -> SolutionInfo:
    res = SolutionInfo()
    num = input('Please provide problem number.')
    res.set_num(int(num))
    link = input('Please provide problem link.')
    res.link = link
    return res


def read_package():
    with open('Package.swift', 'r', encoding='utf-8') as file:
        lines = file.readlines()

    modified_lines = []
    in_products = False
    in_targets = False
    for line in lines:
        line = line.strip()
        if line.startswith('products:'):
            in_products = True
        elif line.startswith('targets'):
            in_targets = True
        elif line == '],' and in_products:
            in_products = False

        if in_products:
            if



if __name__ == '__main__':
    info = read_info()