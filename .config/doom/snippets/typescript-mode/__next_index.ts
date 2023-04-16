import Head from "next/head";
import { GetServerSidePropsContext } from "next";

interface Post {
  id: string;
  title: number;
  body: string;
  created_at: Date;
  author: string;
}

interface Props {
  post: Post;
}

const Home = (props: Props) => {
  return (
    <>
      <Head>
        <title>Posts list</title>
        <meta
          name="description"
          content="Blog made with NextJs and Supabase"
        />
        <meta
          name="viewport"
          content="width=device-width, initial-scale=1"
        />
        <link rel="icon" href="/favicon.ico" />
      </Head>
      <main>
        <h1>{props.post.title}</h1>
        <p>{props.post.body}</p>
      </main>
    </>
  );
};

export const getServerSideProps = async (ctx: GetServerSidePropsContext) => {};
