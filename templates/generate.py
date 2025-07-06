# import json 
import yaml
from jinja2 import Environment, FileSystemLoader
from pathlib import Path
import re 
import shutil

def extract_user_code_blocks(content):
    pattern = re.compile(r'/\*\s*User Code Start:(.*?)\s*\*/\n(.*?)/\*\s*User Code End:\1\s*\*/', re.DOTALL)
    return {key.strip(): body for key, body in pattern.findall(content)}

def merge_generated_with_existing(old_text, new_text):
    old_blocks = extract_user_code_blocks(old_text)

    def replace_block(match):
        key = match.group(1).strip()
        if key in old_blocks:
            return f'/* User Code Start: {key} */\n{old_blocks[key]}/* User Code End: {key} */'
        else:
            return match.group(0)

    pattern = re.compile(r'/\*\s*User Code Start:(.*?)\s*\*/\n(.*?)/\*\s*User Code End:\1\s*\*/', re.DOTALL)
    return pattern.sub(replace_block, new_text)

def get_config(cfg: str):
    with open(cfg) as f :
        return yaml.safe_load(f)

    print(f"Not find {cfg}")

def generate(cfg, template, target, target_dir):
    class_data = get_config(cfg)

    env = Environment(loader=FileSystemLoader("."))
    cpp_template = env.get_template(template)
    # 3. 渲染模板为新代码
    new_code = cpp_template.render(class_data)
    if Path(target_dir + '/' + target).exists():
        # copy to tmp dir
        dst_dir = Path("../tmp")
        dst_file = dst_dir / (target + '.old')
        shutil.copy(target_dir + '/' + target, dst_file)
        print(f'save the old version at {dst_file}')

    try:
        with open("../tmp/" + target + ".old", "r") as f:
            old_code = f.read()
        merged_code = merge_generated_with_existing(old_code, new_code)
        with open(target_dir + '/' + target, "w") as f:
            f.write(merged_code)
        print(f"合并成功，已输出 {target}（保留旧实现）")
    except FileNotFoundError:
        with open(target_dir + '/' + target, "w") as f:
            f.write(new_code)
        print(f"初次生成，已输出 {target}")

def main():
    generate("instrs.yaml", "Instructions.hpp.jinja2", "Instructions.hpp", "../src/IR")
    generate("instrs.yaml", "Instructions.cpp.jinja2", "Instructions.cpp", "../src/IR")
    generate("builder.yaml", "IRBuilder.hpp.jinja2", "IRBuilder.hpp", "../src/IR")


if __name__ == "__main__":
    main()
