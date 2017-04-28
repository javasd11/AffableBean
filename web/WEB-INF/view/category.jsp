<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var='view' value='/category' scope='session' />

<div id="categoryLeftColumn">

   <c:forEach var="category" items="${applicationScope.categories}">

        <c:choose>
            <c:when test="${category.name == sessionScope.selectedCategory.name}">
                <div class="categoryButton" id="selectedCategory">
                    <span class="categoryText">  <fmt:message key='${category.name}'/>  </span>
                </div>
            </c:when>
            <c:otherwise>
                <a href="category?${category.id}" class="categoryButton">
                    <span class="categoryText"> <fmt:message key='${category.name}'/> </span>
                </a>
            </c:otherwise>
        </c:choose>

    </c:forEach>

</div>

<div id="categoryRightColumn">

    <p id="categoryTitle">${sessionScope.selectedCategory.name}</p>

    <table id="productTable">

        <c:forEach var="product" items="${sessionScope.selectedCategory.productCollection}" varStatus="iter">

            <tr class="${((iter.index % 2) == 0) ? 'lightBlue' : 'white'}">
                <td>
                    <img src="${initParam.productImagePath}${product.name}.png" alt="${product.name}">
                </td>

                <td>
                    ${product.name}
                    <br>
                    <span class="smallText">${product.description}</span>
                </td>

                <td>&euro; ${product.price}</td>

                <td>
                    <form action="<c:url value='addToCart'/>" method="post">
                        <input type="hidden" name="productId" value="${product.id}">
                        <input type="submit" name="submit" value="add to cart">
                    </form>
                </td>
            </tr>

        </c:forEach>

    </table>
</div>