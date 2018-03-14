require "torture/snippet"

module TortureHelper
  def snippet(component, section, collapse: "methods", file:nil)
    config = current_page.data["torture"]
    config = config[component]

    file ||= config[:default_file]
    root = config[:root] or raise "No root found for #{component}"

    Torture::Snippet.extract_from(file: file, root: root, marker: section, collapse: collapse, unindent: true)
  end

  def github_link(component, section, collapse: "methods", file:nil)
    config = current_page.data["torture"]
    config = config[component]

    file ||= config[:default_file]
    root = config[:root] or raise "No root found for #{component}"

    path_and_line = Torture::Snippet.extract_line_number_and_filename_from(file: file, root: root, marker: section)
    path = path_and_line[:path].split('/').drop(2).join('/')
    line = path_and_line[:line]
    link = Torture::Snippet.build_github_link(github_user: 'trailblazer',
                                               gem_name: "trailblazer-#{component}",
                                               path: path,
                                               line_number: line )
    markdown_link = "[See code on Github](#{link})"
  end

end



