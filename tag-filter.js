(() => {
  const benchmarks = [...document.querySelectorAll('.testrun[data-tags]')];
  const rows = [...document.querySelectorAll('tr[data-tags]')];
  const tags = new Set(benchmarks.flatMap(node => node.dataset.tags.split(/\s+/).filter(Boolean)));
  const summary = [...document.querySelectorAll('.ranks, .finished')];
  const notice = document.createElement('p');
  notice.id = 'tag-filter-status';
  notice.hidden = true;
  notice.setAttribute('role', 'status');
  const label = document.createElement('span');
  const clear = document.createElement('a');
  clear.href = '#';
  clear.textContent = 'Back to all benchmarks';
  notice.append(label, document.createTextNode(' '), clear);
  document.querySelector('.speed-rank').prepend(notice);

  function applyFilter() {
    let tag = null;
    if (location.hash.startsWith('#tag=')) {
      try {
        const candidate = decodeURIComponent(location.hash.slice(5));
        if (tags.has(candidate)) tag = candidate;
      } catch { /* An invalid fragment leaves the full list visible. */ }
    }
    for (const node of [...benchmarks, ...rows]) {
      node.hidden = tag !== null && !node.dataset.tags.split(/\s+/).includes(tag);
    }
    for (const node of summary) node.hidden = tag !== null;
    notice.hidden = tag === null;
    label.textContent = tag === null ? '' : `Showing ${tag} benchmarks only.`;
    for (const link of document.querySelectorAll('.tags a')) {
      if (tag !== null && link.textContent === tag) link.setAttribute('aria-current', 'true');
      else link.removeAttribute('aria-current');
    }
    if (tag !== null) notice.scrollIntoView({block: 'start'});
  }

  window.addEventListener('hashchange', applyFilter);
  applyFilter();
})();
