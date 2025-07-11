package main

import (
	"context"
	"fmt"

	"github.com/aws/aws-lambda-go/lambda"
)

type MyEvent struct {
	Name string `json:"name"`
}

func HandleRequest(ctx context.Context, name MyEvent) (string, error) {
	fmt.Println(name)

	return fmt.Sprintf("Hello-v2 %s!", name.Name), nil
}

func main() {
	lambda.Start(HandleRequest)
}
