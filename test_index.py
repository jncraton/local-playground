import re
from playwright.sync_api import Page, expect
import pytest

from pathlib import Path

file_url = Path("index.html").resolve().as_uri()

@pytest.fixture
def root(page: Page):
    page.goto(f"{file_url}#")
    return page

def test_page_title(root):
    expect(root).to_have_title("Local Playground")

def test_basic_html(root):
    root.get_by_label('HTML').fill('<h1>Hello, world</h1>')
    expect(root.frame_locator('iframe').locator('h1')).to_contain_text("Hello, world")
