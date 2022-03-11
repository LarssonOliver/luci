import type { IncomingMessage, ServerResponse } from "http";
import { sendRedirect } from "h3";

export default async (req: IncomingMessage, res: ServerResponse) => {
  const id = req.url.split("/")[1];

  if (!id || isNaN(+id)) {
    res.statusCode = 400;
    return "Bad Request";
  }

  const pic = await fetch(`https://picsum.photos/id/${+id}/200/300`);
  return sendRedirect(res, pic.url);
};
