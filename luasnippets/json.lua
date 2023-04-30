return {
  s(
    {
      trig = "awsvd",
      name = "aws-app-variable-dev",
      description = "AWS Dev Environment Variable",
    }, {
      t({
        ",",
        "{",
        '    "name": "',
      }),
      i(1, ""),
      t({
        '",',
        '    "valueFrom": "arn:aws:ssm:us-east-1:096790407971:parameter/',
      }),
      c(2, { t("dev"), t("staging"), t("prod") }),
      t("/"),
      rep(1),
      t({
        '"',
        '}'
      }),
    }
  ),
}
