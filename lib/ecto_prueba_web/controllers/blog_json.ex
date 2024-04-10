defmodule EctoPruebaWeb.BlogJSON do
  alias EctoPrueba.Blogs.Blog

  def index(%{blogs: blogs}) do
    blog_list =
      for blog <- blogs do
        blog_data(blog)
      end

    %{
      success: true,
      data: blog_list
    }
  end

  def blog_data(%Blog{} = blog) do
    %{
      title: blog.title,
      short_content: Blog.get_short_content(blog)
    }
  end
end
