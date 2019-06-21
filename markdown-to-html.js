#!/usr/bin/env node

const unified = require('unified');
const stream = require('unified-stream');
const parse_markdown = require('remark-parse');
const add_slug_id_to_titles = require('remark-slug');
const add_table_of_content = require('remark-toc');
const add_attrs_to_external_links = require('remark-external-links');
const highlight_code = require('highlightjs');
const markdown_to_html = require('remark-rehype');
const format_html = require('rehype-format');
const add_header_html = require('rehype-document');
const stringify_html = require('rehype-stringify');
const header_metadata = require('./header-metadata.json');

const processor = unified()
    .use(parse_markdown)
    .use(add_slug_id_to_titles)
    .use(add_table_of_content, {
        heading: 'table[ -]of[ -]contents?|tabla[ -]de[ -]contenidos?'
    })
    .use(add_attrs_to_external_links)
    .use(highlight_code)
    .use(markdown_to_html)
    .use(add_header_html, header_metadata)
    .use(format_html, { indent: 4 })
    .use(stringify_html);

process.stdin.pipe(stream(processor)).pipe(process.stdout);
