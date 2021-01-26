export function hello() {
  document.getElementById('content_page_markdown').addEventListener('click', function() {
    document.getElementById('markdown-render').innerHTML = 'changed';
  });
}

alert('hey');