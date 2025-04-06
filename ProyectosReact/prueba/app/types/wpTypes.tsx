export interface Noticia {
  id: number;
  title: {
    rendered: string;
  };
  content: {
    rendered: string;
  };
  date: string;
  _embedded?: {
    "wp:featuredmedia"?: Array<{
      source_url: string;
    }>;
  };
}
export interface Post {
  id: number;
  title: string;
  content: string;
  date: string;
  image?: string;
}
